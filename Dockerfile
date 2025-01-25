# Dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy project files
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Run the app
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]
