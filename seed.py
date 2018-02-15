from model import Pet, Shelter, Photo, Breed, PetBreed, connect_to_db, db
import search
import os
import requests
import xmltodict

""" Seed database with data from API call."""

key = os.environ['PETFINDER_KEY']
secret = os.environ['PETFINDER_SECRET']


def create_shelter_object(shelter):
    """Take shelter attributes out of dictionary content and instantiate a Shelter object."""
    new_shelter = Shelter(shelter_id=shelter['id'],
                          shelter_name=shelter['name'].encode('utf-8'))
    db.session.add(new_shelter)
    return new_shelter


def create_pet_object(pet_entry):
    """ Take pet attributes out of dictionary content and instantiate a Pet object."""
    new_pet = Pet(pet_id = pet_entry['id'],
                  shelter_id=pet_entry['shelterId'], 
                  pet_name=pet_entry['name'].encode('utf-8'), 
                  pet_description=pet_entry['description'].encode('utf-8'),
                  lastupdate=pet_entry['lastUpdate'].encode('utf-8'), 
                  pet_type=pet_entry['animal'].encode('utf-8'))
    db.session.add(new_pet)
    db.session.commit()
    print "Added a Pet!"

def create_photo_object(pet_entry, photo_entry):
    """Take photo attributes out of pet mini-dictionary and instantiate a Photo object."""
    
    # Get pet ID out of database and store as foreign key.
  
    new_photo = Photo(pet_id=pet_entry['id'],
                      pf_id=photo_entry['@id'],
                      photo_size=photo_entry['@size'],
                      photo_text=photo_entry['#text'])
    db.session.add(new_photo)

    print "Loaded Photos."

def create_breed_object(breed):
    """ Check DB to see if there's a breed record. If not, make a new breed and get its id.
    If there is one, get its id."""
     # Look in the database to see if breed already exists.
    sql = "SELECT breed_id, breed_name FROM breeds WHERE breed_name = :name"
    cursor = db.session.execute(sql, {'name': breed})

    result = cursor.fetchone()

     # If it does, find its primary key and use that to make a pet breed record.
    if result is None:
    # If it doesn't, make a new record, and use its primary key to make a new pet breed record.
        new_breed = Breed(breed_name=breed)
        db.session.add(new_breed)
        db.session.commit()
        print "Added new Breed"


def get_breed_id(breed):
    """ Function to return breed ID from database."""
    sql = "SELECT breed_id FROM breeds WHERE breed_name = :name"
    cursor = db.session.execute(sql, {'name': breed})
    print "Looking up", breed
    breed_id = cursor.fetchone()
    print "***** Pet breed ID Is", breed_id[0]
    return breed_id[0]


def get_pet_breeds(pet_id):
    """ Function to return current pet breed(s) from database."""

    sql = "SELECT breed_id FROM petbreeds WHERE petbreeds.pet_id = :pet_id"
    cursor = db.session.execute(sql, {'pet_id' : pet_id})
    print "looking up", pet_id
    petbreed_ids = cursor.fetchall()
    print "******** Pet breeds found are", petbreed_ids

    return petbreed_ids 


def create_petbreed_object(pet_entry, breed):
    """Take breed attributes out of pet list ,
     then link to pet."""
    
    petbreed_id = get_breed_id(breed)
    
    new_petbreed = PetBreed(pet_id=pet_entry['id'],
                            breed_id=petbreed_id)

    db.session.add(new_petbreed)

    print "Loaded a Pet's Breeds."

def load_shelters(all_shelters):
    """Get shelter data for nearby shelters from dictionary. Add shelters to db."""
    for shelter_dict in all_shelters['petfinder']['shelters']['shelter']:
        new_shelter = create_shelter_object(shelter_dict)
    db.session.add(new_shelter)

    print "Loaded Shelters."


def load_pets(all_pets):
    """ Validate sibling mention in pet names. Load responsive pets into database."""
    # First, clear any previous seeding.
    Photo.query.delete()
    PetBreed.query.delete()
    Breed.query.delete()
    Shelter.query.delete()

    # Commit, in order to clear pet records
    db.session.commit()
    
    Pet.query.delete()
    
    

    pair_phrases = ["and", "&", "brother", "sister", "sibling", "bonded", "pair"]
    for pet_dict in all_pets['petfinder']['pets'].values():
        for pet in pet_dict:
            # If pet name includes possible sibling, make a dictionary entry
            if search.is_possible_sibling(pet['name'], pair_phrases):
                create_pet_object(pet)
            # If pet record contains photos, add a link to predetermined size photo.
                if pet['media']:
                    # Load links to one "l" photo for each pet.
                    if pet['media']['photos']['photo']:
                        photo_exists = False
                        for photo_record in pet['media']['photos']['photo']:
                            if photo_record['@size'] == 'x':
                                if photo_exists == False:
                                    create_photo_object(pet, photo_record)
                                    photo_exists = True
            # Load breeds associated with each pet. 
                if pet['breeds']:
                    # Create a new breed if it's not in the db already.
                    created_solo_breed = False
                    for breed in pet['breeds']['breed']:
                        # Pet could have one breed or a list of breeds.
                        if len(breed) > 1:
                            create_breed_object(breed)
                            create_petbreed_object(pet, breed)
                        else:
                            while created_solo_breed is False:
                                create_breed_object(pet['breeds']['breed'])
                                create_petbreed_object(pet, pet['breeds']['breed'])
                                created_solo_breed = True
                        
                        





 
def get_api_pet(pet_id):
    """ Query the API for more info about a given pet."""

    # Payload for requests library
    pet_search_terms = {'key': key, 'id': pet_id}

    # Send payload to Petfinder API. Helper function returns a dictionary.
    current_pet = search.get_pet(pet_search_terms)

    return current_pet


def get_api_shelter(shelter_id):
    """ Query the API for more info about a given shelter."""

    # Payload for requests library
    shelter_search_terms = {'key': key, 'id': shelter_id}

    # Send payload to Petfinder API. Helper function returns a dictionary.
    current_shelter = search.get_shelter(shelter_search_terms)

    return current_shelter


def seed_database():
    pet_search_terms = {'key': key, 'animal': 'cat', 'location': '94110', 'count': 1000}

    # shelter_search_terms = {'key': key, 'location': '94110', 'count': 1000}

    # current_shelters = search.get_current_shelters(shelter_search_terms)

    current_pets = search.get_current_pets(pet_search_terms)

    # load_shelters(current_shelters)

    load_pets(current_pets)

    db.session.commit()


  