# Python Sample App (Flask)

## Run locally
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
flask run --port 5000
```

## Docker
```bash
docker build -t python-app:local .
docker run -p 5000:5000 --rm python-app:local
```