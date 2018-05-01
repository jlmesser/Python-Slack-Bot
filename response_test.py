from flask import Flask, request, Response
from slackclient import SlackClient
import os

app = Flask(__name__)

SLACK_WEBHOOK_SECRET = 'vxgfWPR24UzBe4ghQjM6NHrD'
SLACK_BOT_TOKEN = "xoxb-346530816165-nfEV1kKcPLrHRaQ3hmSBBBQI"

slack_client = SlackClient(SLACK_BOT_TOKEN)

@app.route('/slack', methods=['POST']) 
def inbound():
    
    if request.form.get('token') == SLACK_WEBHOOK_SECRET:
        channel = request.form.get('channel_name')
        username = request.form.get('user_name')
        text = request.form.get('text')
        inbound_message = username + " in " + channel + " says: " + text
        
        print(inbound_message) #does not work!

        send_message(channel, inbound_message)
    return Response(), 200


@app.route('/', methods=['GET'])
def test():
    return Response('does it work??')

def send_message(channel_id, message):

    slack_client.api_call(
        "chat.postMessage",
        channel=channel_id,
        text=message,
        username='pythonbot',
        icon_emoji=':robot_face:'
    )

if __name__ == "__main__":
    app.run(debug=True)

    
