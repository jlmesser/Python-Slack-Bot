from flask import Flask, request, Response
app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello():
    return response("Hello World!")

if __name__ == "__main__":
    app.run(debug=True)
