# OAUTH for PetFinder API.
# For GET calls, all arguments are specified in the URL query string like this:
 # http://api.petfinder.com/my.method?key=12345&arg1=foo&token=67890&sig=abcdef

import os
import requests
import xmltodict


key = os.environ['PETFINDER_KEY']
secret = os.environ['PETFINDER_SECRET']


def get_current_pets(payload):
    """ Send request to API return dictionary of pet search results"""

    r = requests.get(
        "http://api.petfinder.com/pet.find?",
        params=payload)

    pet_dict = xmltodict.parse(r.text)
    return pet_dict


def is_possible_sibling(text, phrases):
    # Identify if pet description contains mention of potential sibling or friend.
    text_list = text.split()
    for word in text_list:
        word = word.lower()
        if word in phrases:
                return True


def possible_friend_name(phrase):
    # Identify possible name of friend or sibling from description or name.
    # Disregard root pet name.
    pass


def all_pet_results(all_pets, phrases):
    pet_names = {}
    for pet_dict in all_pets['petfinder']['pets'].values():
        for pet in pet_dict:
            # If pet name includes possible sibling, make a dictionary entry
            if is_possible_sibling(pet['name'], phrases):
                pet_names[pet['name']] = []
                # If description includes affection keywords, append dictionary value
                if is_affectionate(pet['description']):
                    pet_names[pet['name']] = [pet['description']]  
        print len(pet_names)
        return pet_names


def find_friend(name, pet_dict):
    # Search same-shelter listings for a pet with matching friend/sibling name.
    # Input: pet dictionary including each pet's shelter
    # Identify listings from same shelter
    # exclude originating pet, search for sibling name
    pass


def is_affectionate(text):
    """Input: origin text; output: boolean."""
    affection_phrases = ["snuggle", "cuddly", "lap", "hug", "affectionate", "friendly"]
    text_list = text.split()
    for word in text_list:
        word = word.lower()
        if word in affection_phrases:
            return True



def word_frequency(blob):
    """Input: blob, output: word frequency."""
    pass

def affectionate_pets():
    """ Input: dictionary of pets, output: pet names and descriptions of
    affectionate pets."""
    pass


test_search_terms = {'key': key, 'animal': 'cat', 'location': '94110', 'count': 1000, 'offset': 100}
pair_phrases = ["and", "&", "brother", "sister", "sibling", "bonded", "buddy", "pair"]

current_pets = get_current_pets(test_search_terms)

print all_pet_results(current_pets, pair_phrases)


