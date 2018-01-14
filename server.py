from flask import Flask, request, render_template, jsonify, url_for
from flask_googlemaps import GoogleMaps, Map
from flask.ext.sqlalchemy import SQLAlchemy
from model import Pet, Shelter, Photo, connect_to_db, db
import seed
import json
from twilio.twiml.voice_response import VoiceResponse
from twilio.rest import Client

import os
google_key = os.environ['GOOGLE_SECRET']

# Declare and configure application
app = Flask(__name__, static_url_path='/static')
app.config.from_pyfile('local_settings.py')

@app.route('/')
def index():
    """Return homepage."""
    return render_template("homepage.html")


@app.route('/search')
def search():
    """Return search results."""

    # Query database for pets and shelters.
    # Pass search results to page.

    pet_results = db.session.query(Pet.pet_name, 
                               Pet.pet_id,
                               Pet.pet_description,
                               Pet.shelter_id, 
                               Pet.lastupdate,
                               Photo.photo_text, 
                               Photo.photo_size).join(Photo).all()


    #todo: get current date from python, query DB for lastupdate within a date range

    return render_template("search.html", pet_results=pet_results)


@app.route('/pet/<int:pet_id>')
def display_pet(pet_id):
    """ Display individual pet."""

    pet = seed.get_api_pet(pet_id)

    print "************"
    print "pet is", pet['petfinder']['pet']['name']

    pet = pet['petfinder']['pet']

    shelter = seed.get_api_shelter(pet['shelterId'])

    print "shelter is", shelter['petfinder']['shelter']['name']

    shelter = shelter['petfinder']['shelter']
    print pet.keys()

    return render_template("profile.html", pet=pet, shelter=shelter, google_key=google_key)


@app.route('/pet.json')
def display_pet_json():
    """ Display individual pet in json format. For AJAX use."""
    pet_id = request.args.get("pet_id")

    pet = seed.get_api_pet(pet_id)

    pet = pet['petfinder']['pet']

    return jsonify(pet)


@app.route('/shelter.json')
def display_shelter():
    """ Display shelter info."""

    shelter_id = request.args.get("shelter_id")
    print "&&&&&&&&&&&&& SHELTER ROUTE &&&&&&&&&&&&&"
    print shelter_id
    print "&&&&&&&&&&&&&"

    shelter = seed.get_api_shelter(shelter_id)

    shelter = shelter['petfinder']['shelter']

    print shelter

    print "#########################"

    return jsonify(shelter)

@app.route('/shelters')
def display_shelter_pets():
    """ Display pets in a given shelter."""

    pass

# Below code is from combined Twilio tutorials, https://github.com/TwilioDevEd/clicktocall-flask/


@app.route('/text', methods=['POST'])
def call():
    # Get phone number we need to call
    print "*********"
    print "Made it into twilio text route"

    print "*********"
    print request.form
    phone_number = request.form.get('phoneNumber')
    #TODO: get photo link and pet listing link from text

    print phone_number

    try:
        twilio_client = Client(app.config['TWILIO_ACCOUNT_SID'],
                               app.config['TWILIO_AUTH_TOKEN'])
    except Exception as e:
        msg = 'Missing configuration variable: {0}'.format(e)
        return jsonify({'error': msg})

    try:
        message = twilio_client.messages.create(from_=app.config['TWILIO_CALLER_ID'],
                                   to=phone_number,
                                   body="Visit me! https://www.petfinder.com/cat/mr-whiskers-40604562/ca/san-francisco/give-me-shelter-cat-rescue-ca1061/",
                                   media_url="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/40604562/1/?bust=1515320820")
        print(message.sid)

    except Exception as e:
        app.logger.error(e)
        return jsonify({'error': str(e)})


    return jsonify({'message': 'Call incoming!'})



if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    connect_to_db(app)

