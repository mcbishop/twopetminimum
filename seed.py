from model import Pet, connect_to_db, db
import search
import os
import requests
import xmltodict

""" Seed database with data from API call."""

key = os.environ['PETFINDER_KEY']
secret = os.environ['PETFINDER_SECRET']


def create_shelter_object(shelter):
    # Take shelter attributes out of dictionary content and instantiate a Shelter object.
    pass


def create_pet_object(pet_entry):
    # Take pet attributes out of dictionary content and instantiate a Pet object.
    new_pet = Pet(shelter_id=pet_entry['shelterId'], 
                  pet_name=pet_entry['name'], 
                  pet_description=pet_entry['description'],
                  pet_type=pet_entry['animal'])
    return new_pet

# def add_possible_object(shelter, pets):  
#     def load_shelters():
#         pass



def load_pets(all_pets):
    pair_phrases = ["and", "&", "brother", "sister", "sibling", "bonded", "buddy", "pair"]
    for pet_dict in all_pets['petfinder']['pets'].values():
        for pet in pet_dict:
            # If pet name includes possible sibling, make a dictionary entry
            if search.is_possible_sibling(pet['name'], pair_phrases):
                new_pet = create_pet_object(pet)
                db.session.add(new_pet)

    db.session.commit()


test_search_terms = {'key': key, 'animal': 'cat', 'location': '94110', 'count': 1000, 'offset': 100}


current_pets = search.get_current_pets(test_search_terms)

load_pets(current_pets)