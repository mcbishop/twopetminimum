from flask import Flask, request, render_template

app = Flask(__name__)


@app.route('/')
def index():
    """Return homepage."""
    return render_template("homepage.html")


@app.route('/search')
def search():
    """Return search results."""

    # Query database for pets and shelters.
    # Display pets on the page.

    pass


@app.route('/shelters')
def display_shelter_pets():
    """ Display d3 chart of pets in a given shelter."""

    pass


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
