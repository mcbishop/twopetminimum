from flask import Flask, request, render_template
from flask.ext.sqlalchemy import SQLAlchemy
from model import Pet, Shelter, Photo, connect_to_db, db
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

    #TODO: Bring back only one photo per pet.
    pet_results = db.session.query(Pet.pet_name, 
                               Pet.pet_id,
                               Pet.pet_description,
                               Pet.shelter_id, 
                               Pet.lastupdate,
                               Photo.photo_text, 
                               Photo.photo_size).join(Photo).filter(Photo.photo_size=='x').order_by(Pet.lastupdate.desc()).all()
    print pet_results

    #todo: get current date from python, query DB for lastupdate within a date range

    return render_template("search.html", pet_results=pet_results)


@app.route('/shelters')
def display_shelter_pets():
    """ Display pets in a given shelter."""

    pass


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')

    connect_to_db(app)

