FROM python:3.11-slim

# Install dependencies for Node.js
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Install npm dependencies and build Tailwind CSS
RUN cd theme/static_src && npm install && npm run build

# Collect static files with Whitenoise
RUN python manage.py collectstatic --noinput

# Run migrations (Optional: better run at start, but doing it here for simplicity)
RUN python manage.py migrate

EXPOSE 8000

# Set up gunicorn to serve the app efficiently
CMD ["gunicorn", "portfolio.wsgi:application", "--workers", "1", "--threads", "2", "--bind", "0.0.0.0:8000"]
