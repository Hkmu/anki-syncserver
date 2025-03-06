FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y \
  gcc \
  python3-dev \
  && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python3 -m venv /app/venv

# Install Anki
RUN . /app/venv/bin/activate && \
  pip install --no-cache-dir anki

COPY .env .env

# Create data directory
RUN mkdir -p /app/data

# Expose the default sync server port
EXPOSE 8080

# Set the entrypoint
CMD . /app/venv/bin/activate && \
  python -m anki.syncserver
