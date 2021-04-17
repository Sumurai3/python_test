from flask import Flask,request,jsonify
from flask_cors import CORS
import pymysql


app=Flask(__name__)
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='Sumit@123',
                             database='AudioFiles',
                            cursorclass=pymysql.cursors.DictCursor)
with app.app_context():
    cors = CORS(app, support_credentials=True)



