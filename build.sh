#!/usr/bin/env bash
# build.sh — Render.com build script
set -o errexit   # exit immediately if any command fails

echo "=== Installing Python dependencies ==="
pip install -r requirements.txt

echo "=== Installing Node dependencies & building Tailwind CSS (minified) ==="
cd theme/static_src
npm install
npm run build   # produces minified CSS in static/css/dist/styles.css
cd ../..

echo "=== Collecting static files ==="
python manage.py collectstatic --noinput

echo "=== Running database migrations ==="
python manage.py migrate

echo "=== Build complete ==="
