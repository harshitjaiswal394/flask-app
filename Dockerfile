FROM cgr.dev/chainguard/python:latest-dev

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copy requirements first for caching
COPY requirements.txt .

# Install pip (if not already available in -dev image)
RUN ["python", "-m", "ensurepip"]
RUN ["python", "-m", "pip", "install", "--no-cache-dir", "--upgrade", "pip", "setuptools", "wheel"]

# Install project dependencies
RUN ["python", "-m", "pip", "install", "--no-cache-dir", "-r", "requirements.txt"]

# Copy app source
COPY app ./app
COPY wsgi.py .

EXPOSE 5000

# Gunicorn entrypoint
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
