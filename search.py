# OAUTH for PetFinder API.
# For GET calls, all arguments are specified in the URL query string like this:
 # http://api.petfinder.com/my.method?key=12345&arg1=foo&token=67890&sig=abcdef

import os
import requests
import json
import untangle
import xmltodict
import pprint

key = os.environ['PETFINDER_KEY']
secret = os.environ['PETFINDER_SECRET']

payload = {'key':key, 'animal':'cat', 'location':'94110', 'count': 1000, 'offset': 100}

SEARCH_TERMS = ["and","&","brother","sister","sibling","bonded","buddy","pair"]

# Send request to API and parse returned data

r = requests.get(
    "http://api.petfinder.com/pet.find?",
    params=payload)


my_dict = xmltodict.parse(r.text)


def is_possible_sibling(text):
	# Identify if pet description contains mention of potential sibling or friend.
	text_list = text.split()
	for word in text_list:
		word = word.lower()
		if word in SEARCH_TERMS:
			print "############## FOUND ####################"
			return True


def possible_friend_name(phrase):
	# Identify possible name of friend or sibling from description or name.
	# Disregard root pet name.


	pass

def all_pet_results(pet_dict):
	pet_names = {}
	for pet_dict in my_dict['petfinder']['pets'].values():
		for pet in pet_dict:
			# print pet['name']
			# print "+++++++++++++++++++", pet['id'], "++++++++++++++++"
			if is_possible_sibling(pet['name']) is True:
				pet_names[pet['name']] = []
				# if possible_friend_name(pet['name']) is True:
				# 	print "I might have a friend"

				# print pet
				
		print len(pet_names)
		print pet_names

all_pet_results(my_dict)



def find_friend(name, pet_dict):
	# Search same-shelter listings for a pet with matching friend/sibling name.
	# Input: pet dictionary including each pet's shelter
	# Identify listings from same shelter
	# exclude originating pet, search for sibling name
	pass

def dedupe_results(text):
	# Dedupe set of results as shelters list same two pets in different order.
	pass



def is_affectionate(description):
	# check phrase for snuggle words
	# for word in description:
	# 	if ("lap" or "snuggle" or "hug"):
		# for each word, assign a point, sum will equal affection rating 
	pass

def affection_rating(description):
	# sentiment analysis 
	pass