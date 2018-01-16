from flask import Flask, request, redirect, session, render_template, jsonify, url_for
from flask_googlemaps import GoogleMaps, Map
from flask.ext.sqlalchemy import SQLAlchemy
from model import Pet, Shelter, Photo, connect_to_db, db
import seed
import json
from twilio.rest import Client

import os
google_key = os.environ['GOOGLE_SECRET']


# Declare and configure application
app = Flask(__name__, static_url_path='/static')
app.config.from_pyfile('local_settings.py')

# set the secret key. 
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

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


    session['pet_id'] = pet_id

    print "************"
    print "pet is", pet['petfinder']['pet']['name']


    pet = pet['petfinder']['pet']

    shelter = seed.get_api_shelter(pet['shelterId'])

    print "shelter is", shelter['petfinder']['shelter']['name']

    shelter = shelter['petfinder']['shelter']
    print pet
    print pet.keys()

    return render_template("profile.html", pet=pet, shelter=shelter, google_key=google_key)

@app.route('/pet/suggest')
def pet_suggester():
    """ Suggest additional pets."""

    pet_id = session['pet_id']
    # Look up current pet's pet ids
    pet_breed_ids = seed.get_pet_breeds(pet_id)

    #unpack tuples into a list
    breeds_list = [breed_id.breed_id for breed_id in pet_breed_ids]

    suggested_pets = []
    # Look up more pets who match those IDs and suggest them
    for breed in breeds_list:
        suggested_pets.append(suggest_pet(breed))
        
    suggested_pet_list = [pet.pet_id for pet in suggested_pets]

    print suggested_pet_list

    pass


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
    pet_photo = request.form.get('photo_url')
    pet_id = request.form.get('pet_id')

    url = "http://www.twocatminimum.com/pet/"+pet_id


    try:
        twilio_client = Client(app.config['TWILIO_ACCOUNT_SID'],
                               app.config['TWILIO_AUTH_TOKEN'])
    except Exception as e:
        msg = 'Missing configuration variable: {0}'.format(e)
        return jsonify({'error': msg})

    try:
        message = twilio_client.messages.create(from_=app.config['TWILIO_CALLER_ID'],
                                   to=phone_number,
                                   body="Visit me! "+ url,
                                   media_url=pet_photo)
        print(message.sid)

    except Exception as e:
        app.logger.error(e)
        return jsonify({'error': str(e)})

    return redirect('/pet/'+str(session['pet_id']))

####### HELPER FUNCTION ########


def suggest_pet(pet_breed):
    """ Look at current pet's breed, age, size, and find similar pets.
    TODO: identify pet color and fur length, since they're not in XML returned by API.

    Groupings other than exact match:
           (Domestic Short Hair, American Shorthair)
        (Maine Coon, Domestic Long Hair)
    """


    sql = "SELECT pet_id FROM petbreeds WHERE petbreeds.breed_id = :name"

    cursor = db.session.execute(sql, {'name': pet_breed})
    petbreed_ids = cursor.fetchall()
    return petbreed_ids



if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    connect_to_db(app)

