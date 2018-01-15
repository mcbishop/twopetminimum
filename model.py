"""Database model for Two Pet Minumum."""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_to_db(app):
    """Connect to database."""

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///pets'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


class Shelter(db.Model):
    """A Shelter table. One shelter contains many Pets."""

    __tablename__ = 'shelters'

    shelter_id = db.Column(db.String(20), primary_key=True)
    shelter_name = db.Column(db.String(100))

    def __repr__(self):
        return "< Shelter name = {} >".format(self.shelter_name.encode('ascii', 'ignore').decode('ascii'))


class Pet(db.Model):
    """ A table for Pets. Each Pet belongs to a shelter."""

    __tablename__ = 'pets'

    pet_id = db.Column(db.Integer, primary_key=True)
    shelter_id = db.Column(db.String(20))
                           # db.ForeignKey('shelters.shelter_id'))
    pet_name = db.Column(db.String(100))
    pet_breed = db.Column(db.String(100))
    pet_description = db.Column(db.Text)
    pet_type = db.Column(db.String(50))
    lastupdate = db.Column(db.DateTime)

    # shelter = db.relationship('Shelter', backref='pets')

    photo = db.relationship('Photo', backref="pets")

    def __repr__(self):
        return "<Pet name =  {} >".format(self.pet_name.encode('ascii', 'ignore').decode('ascii'))

class PetBreed(db.Model):
    """ A table for Pets. Each pet can have multiple breeds."""

    __tablename__ = 'petbreeds'

    petbreed_id = db.Column(db.Integer, primary_key=True)
    breed_id = db.Column(db.Integer, db.Foreignkey('breeds.breed_id'))

    breed = db.relationship('Breed', backref="petbreeds")

class Breed(db.Model):
    """ A table for Breeds."""

    __tablename__ = 'breeds'
    
    breed_id = db.Column(db.Integer, primary_key=True)
    breed_name = db.Column(String(100))

class Photo(db.Model):
    """A table for Pet photos. Each pet has many photos."""

    __tablename__ = 'photos'

    photo_id = db.Column(db.Integer, primary_key=True)
    pet_id = db.Column(db.Integer, db. ForeignKey('pets.pet_id'))
    pf_id = db.Column(db.String(5))
    photo_size = db.Column(db.String(5))
    photo_text = db.Column(db.String(200))

    pet = db.relationship('Pet', backref='photos')

    def __repr__(self):
        return "<Photo ID = {} Text = {}".format(self.photo_id, 
                                                 self.photo_text.encode('ascii', 'ignore').decode('ascii'))

app = Flask(__name__)

connect_to_db(app)