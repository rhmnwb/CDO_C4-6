# Use the official Python base image (same version as workspace)
FROM python:3.8-slim-buster

# Set the working directory inside the container
WORKDIR /src

# Copy the app files into the container
COPY ./analytics /src

# Install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y build-essential libpq-dev && \
    apt-get clean

# Upgrade pip and install the required Python dependencies
RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

# Define the command to run the app
CMD ["python", "app.py"]
