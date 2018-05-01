from flask import Flask, request, Response
import os

app = Flask(__name__)

SLACK_WEBHOOK_SECRET = 'vxgfWPR24UzBe4ghQjM6NHrD' 

@app.route('/slack', methods=['POST']) 
def inbound():
    
    if request.form.get('token') == SLACK_WEBHOOK_SECRET:
        channel = request.form.get('channel_name')
        username = request.form.get('user_name')
        text = request.form.get('text')
        inbound_message = username + " in " + channel + " says: " + text

        #for testing purposes, flask does not allow easy debugging
        text_file = open("Output.txt", "w")
        text_file.write(inbound_message)
        text_file.close()
        
        print(inbound_message)

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

    
