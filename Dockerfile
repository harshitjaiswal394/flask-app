FROM cgr.dev/chainguard/python:latest

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copy requirements first for caching
COPY requirements.txt .

# Install requirements using python -m pip (direct call, no shell)
RUN ["python", "-m", "pip", "install", "--no-cache-dir", "-r", "requirements.txt"]

# Copy app source
COPY app ./app
COPY wsgi.py .

EXPOSE 5000

# Use exec form for CMD (no shell needed)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
