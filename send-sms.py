# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from twilio.rest import Client
import os

# Find these values at https://twilio.com/user/account
account_sid = os.environ['TWILIO_SID']
auth_token = os.environ['TWILIO_AUTH']
my_phone = os.environ['MY_PHONE']
twilio_phone = os.environ['TWILIO_PHONE']

client = Client(account_sid, auth_token)

client.api.account.messages.create(
    to=my_phone,
    from_=twilio_phone,
    body="Hello there!")