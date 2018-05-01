from flask import Flask, request, Response
from slackclient import SlackClient
import os
import MySQLdb

db = MySQLdb.connect(host="localhost",    # your host #if server local it's localhost
                     user="root",         # your username
                     passwd="",           # your password
                     db="mysql")          # name of the data base


#create cursor object
cur = db.cursor()

# Your app's Slack bot user token
SLACK_BOT_TOKEN = "xoxb-346530816165-nfEV1kKcPLrHRaQ3hmSBBBQI"
SLACK_VERIFICATION_TOKEN = "FSHHCOW3Ho7qJecvfg3NRfco"

# Slack client for Web API requests
slack_client = SlackClient(SLACK_BOT_TOKEN)

app = Flask(__name__)

SLACK_WEBHOOK_SECRET = 'vxgfWPR24UzBe4ghQjM6NHrD' 

text = ""

#when slack posts to the ngrok url
@app.route('/slack', methods=['POST']) 
def inbound():
    
    if request.form.get('token') == SLACK_WEBHOOK_SECRET:
        #username = request.form.get('user_name')
        text = request.form.get('text')

        if text == "get list of all students":
            getAllStudents()

        if text == "not found":
            print("do nothing")
            
        elif "report" in text:
            if "name" in text:
                studentReport("name",text)
            elif "student number" in text:
                studentReport("student number",text)
            elif "not found" not in text:
                print("not found, do nothing") #this print shouldn't do anything, if it's annoying feel free to remove

            else:
                send_message("#general","accepted commands:\n-student report name [student's name, e.g. Charles Green]\n-student report student number [student's student number, e.g. M00554328]\n-get list of all students")


                
    return Response(), 200

def studentReport(searchBy,searchText):
    
    #get data from 'students' table
    cur.execute("SELECT * FROM students")

    #if searching for name
    if searchBy == "name":

        #strip command and extra spaces out of string, leaving name
        searchText = searchText[20:]
        searchText = searchText.strip()

        #search database for entry matching name
        for row in cur.fetchall(): 
            # 3 4 is name, 7 is student number, 0 is studentID
            if (row[3] + " " + row[4]).lower() == searchText.lower():
                #if name match save student data to returnText
                returnText = row[3] + " " + row[4] + " " + row[5] + " " + row[7] + "\n"
                studentID = row[0]

        if studentID == "":
                #name not found, return error message
                send_message("#general","not found")

    #if searching by student number
    elif searchBy == "student number":

        #strip command and extra spaces out of string, leaving name
        searchText = searchText[22:]
        searchText = searchText.strip()
    
        for row4 in cur.fetchall():
            # 3 4 is name, 7 is student number, 0 is studentID
            if row4[7].lower() == searchText.lower():
                #if student number match save student data to returnText
                returnText = row4[3] + " " + row4[4] + " " + row4[5] + " " + row4[7] + "\n"
                studentID = row4[0]

            else:
                #student number not found, return error message
                send_message("#general","not found")

    #arrays to hold list of sobs the student has done
    #first array holds SOB IDs
    #second array holds SOB names
    observedSobs = []
    observedSobNames = []
    i = 0;
    
    #get list of sobs student has done
    cur.execute("SELECT * FROM sob_observations") 
    
    for row2 in cur.fetchall():
        if row2[2] == studentID: #if student has an observed sob
            observedSobs.append(row2[1]) #add observed sob code to list

    #get names of observed sobs
    cur.execute("SELECT * FROM sobs")
    #sob ID 0, name 1

    for row3 in cur.fetchall():
        if row3[0] in observedSobs:
            observedSobNames.append(row3[1])


    returnText = returnText + "observed sobs: " + str(observedSobNames)

    send_message("#general",returnText)
    

def getAllStudents():


    #get data from 'students' table
    cur.execute("SELECT * FROM students")

    returnText = ""
    
    #get list of students from mysql database
    for row in cur.fetchall():
        
        returnText = returnText + row[3] + " " + row[4] + "\n"

    
    db.close()

    send_message("#general",returnText)

def send_message(channel_id, message):

    slack_client.api_call(
        "chat.postMessage",
        channel=channel_id,
        text=message,
        username='pythonbot',
        icon_emoji=':robot_face:'
    )


@app.route('/', methods=['GET'])
def test():
    return Response('Hello World!')

if __name__ == "__main__":
    app.run(debug=True)
