#!/bin/bash
echo "Starting server..."

cd /var/www/spotifake

# Kill any existing gunicorn processes
pkill -f gunicorn || true

# Start gunicorn in background
nohup gunicorn --workers 3 --bind 0.0.0.0:8000 "app:create_app()" > gunicorn.log 2>&1 &

echo "Server started on port 8000"