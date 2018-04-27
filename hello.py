from flask import Flask
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    return "Hello World!"

@app.route('/info', methods=['GET'])
def info():
    hostname = os.uname()[1]
    return "hostname: %s " % hostname

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)