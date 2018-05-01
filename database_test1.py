#!/usr/bin/python
import MySQLdb

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="",           # your password
                     db="mysql")          # name of the data base

#create cursor object
cur = db.cursor()

# SQL code

#get data from 'students' table
cur.execute("SELECT * FROM students")

text = ""

# print all the first cell of all the rows
for row in cur.fetchall():
    text = text + row[3] + " " + row[4] + "\n"
print (text)

db.close()
