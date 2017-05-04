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


# class Shelter(db.Model):
#     """A Shelter table. One shelter contains many Pets."""

#     __tablename__ = 'shelters'

#     shelter_id = db.Column(db.String(20), primary_key=True)
#     shelter_name = db.Column(db.String(100))

#     def __repr__(self):
#         print "< Shelter name = {} ".format(self.name)


class Pet(db.Model):
    """ A table for Pets. Each Pet belongs to a shelter."""

    __tablename__ = 'pets'

    pet_id = db.Column(db.Integer, primary_key=True)
    shelter_id = db.Column(db.String(20))
    # db.ForeignKey('shelters.shelter_id'))
    pet_name = db.Column(db.String(100))
    pet_description = db.Column(db.Text)

    photo_url = db.Column(db.String(200))
    pet_type = db.Column(db.String(50))

    # shelter = db.relationship('Shelter', backref='pets')

    def __repr__(self):
        return "<Pet name =  {} >".format(self.name)


app = Flask(__name__)

connect_to_db(app)