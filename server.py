from flask import Flask, request, render_template, jsonify
from flask_googlemaps import GoogleMaps, Map
from flask.ext.sqlalchemy import SQLAlchemy
from model import Pet, Shelter, Photo, connect_to_db, db
import seed
import json

app = Flask(__name__)

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




    return render_template("profile.html", pet=pet, shelter=shelter)


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



if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    connect_to_db(app)

