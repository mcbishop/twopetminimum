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


def get_pet(payload):
    """ Send request to API and return dictionary of data for one pet."""

    r = requests.get(
        "http://api.petfinder.com/pet.get?",
        params=payload)

    pet_dict = xmltodict.parse(r.text)
    return pet_dict


def get_current_shelters(payload):
    """Send request to API and return dictionary of nearby shelter search results."""

    r = requests.get(
        "http://api.petfinder.com/shelter.find?",
        params=payload)

    shelter_dict = xmltodict.parse(r.text)
    return shelter_dict


def get_shelter_pets(payload):
    """Send request to API and return shelter-specific dictionary of pets."""

    r = requests.get(
        "http://api.petfinder.com/shelter.getPets?",
        params=payload)

    shelterpets_dict = xmltodict.parse(r.text)
    return shelterpets_dict


def is_possible_sibling(text, phrases):
    """Identify if pet name contains mention of potential sibling or friend."""
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
                # if is_affectionate(pet['description']):
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
    affection_phrases = ["snuggle", "cuddly", "lap", "hug", "affectionate", "friendly", "biscuits", "muffins", "purr", "head-butt", "kiss"]
    text_list = text.split()
    for word in text_list:
        word = word.lower()
        if word in affection_phrases:
            return True


def word_frequency(all_pets):
    """Input: dictionary including subdictionary for each pet, output: word frequency in descriptions."""
    word_counts = {}
    for pet_dict in all_pets['petfinder']['pets'].values():
        for pet in pet_dict:
            if pet['description']:
                for word in pet['description'].split():
                    if not word.isdigit():
                        word = word.encode('utf-8').lower()
                        word = word.strip("!-,?.;()")
                        word_counts[word] = word_counts.get(word, 0)+1
    return word_counts


def top_words(word_counts):
    """ Input: dictionary of words and counts. Output: list of top words, sorted by value."""
    all_values = {}
    for key, value in word_counts.items():
        if value not in all_values:
            all_values[value] = [key]
        else:
            all_values[value].append(key)
    return all_values


def affectionate_pets():
    """ Input: dictionary of pets, output: pet names and descriptions of
    affectionate pets."""
    pass


def write_desc(all_pets):
    """Input: dictionary including subdictionary for each pet. Side effect: File 
    including descriptions as one long string. Output: None."""

    with open("descriptions.txt", "w") as f:
        for pet_dict in all_pets['petfinder']['pets'].values():
            for pet in pet_dict:
                if pet['description']:
                    list_desc = pet['description']
                    for word in list_desc:
                        if not word.isdigit():
                            if not word.startswith("http"):
                                if not word.startswith("https"):
                                    word = word.encode('utf-8').lower()
                                    word = word.strip("!-,?.;()")
                                    f.write(" ".join(word))
                                 






test_search_terms = {'key': key, 'animal': 'cat', 'location': '94110', 'count': 1000, 'offset': 100}
pair_phrases = ["and", "&", "brother", "sister", "sibling", "bonded", "pair"]

# current_pets = get_current_pets(test_search_terms)

# pet_dict = all_pet_results(current_pets, pair_phrases)

# freq_dict = word_frequency(current_pets)

# top_words(freq_dict)


