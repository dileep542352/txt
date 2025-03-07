# Use the official Python image with Alpine Linux
FROM python:3.9.6-alpine3.14

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install system dependencies
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["sh", "-c", "gunicorn app:app & python3 main.py"]
