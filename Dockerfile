FROM python:3.11-slim

# Install dependencies to run npm and build Tailwind
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install npm packages
RUN npm install

RUN pip install Django==5.1.4
RUN pip install gunicorn django-tailwind

RUN pip freeze

# Copy the rest of your application
COPY . .

# Run the Django collectstatic command
RUN python manage.py collectstatic --noinput

# Set up gunicorn to serve the app
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]


