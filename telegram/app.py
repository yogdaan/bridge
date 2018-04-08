from flask import Flask, request
import urllib2
app = Flask(__name__)

@app.route('/telegram')
def telegram():
		botUpdate = request.get_json()
		botUpdate["result"][0]
