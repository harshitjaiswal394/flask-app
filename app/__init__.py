from flask import Flask, jsonify

def create_app():
    app = Flask(__name__)

    @app.get("/")
    def index():
        return "Hello from Python Flask!"

    @app.get("/health")
    def health():
        return jsonify(status="ok")

    return app

app = create_app()
