from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from Flask App!"

@app.route("/health")
def health():
    return {"status": "ok"}

def main():
    app.run(host="0.0.0.0", port=5000)
