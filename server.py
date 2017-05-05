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

    pet_results = db.session.query(Pet).all()
    print pet_results

    return render_template("search.html", pet_results=pet_results)


@app.route('/shelters')
def display_shelter_pets():
    """ Display d3 chart of pets in a given shelter."""

    pass


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')

    connect_to_db(app)

