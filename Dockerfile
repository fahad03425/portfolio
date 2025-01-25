# Use Python 3.11 slim image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y nodejs npm

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the application files into the container
COPY . .

# Install Node.js dependencies (including Tailwind CSS)
RUN npm install

# Build Tailwind CSS
RUN npm run build

# Collect static files
RUN python manage.py collectstatic --noinput

# Set the command to run the Django app with Gunicorn
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]

