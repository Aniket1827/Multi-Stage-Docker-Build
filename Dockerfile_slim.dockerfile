# Base image(Builder Image)
FROM python:3.8 as base_image

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the project dependencies
RUN pip install -r requirements.txt

FROM python:3.8-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY --from=base_image /app /app

# Expose the port the Flask application will be listening on
EXPOSE 5000

# Set environment variables, if necessary
# ENV MY_ENV_VAR=value

# Run the Flask application
CMD ["python", "app.py"]
