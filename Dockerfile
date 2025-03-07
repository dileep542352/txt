# Use the official Python image with Debian
FROM python:3.9.6-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["sh", "-c", "gunicorn app:app & python3 main.py"]
