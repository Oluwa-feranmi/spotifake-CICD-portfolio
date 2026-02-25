#!/bin/bash
set -e  # exit on any error

echo "Starting server..."

cd /var/www/spotifake

# Kill any existing gunicorn processes safely
pkill -f gunicorn || true

# Give a second for processes to die
sleep 1

# Start gunicorn with reasonable workers and logging
nohup gunicorn \
  --workers 3 \
  --bind 0.0.0.0:8000 \
  --log-level info \
  --access-logfile /var/log/gunicorn-access.log \
  --error-logfile /var/log/gunicorn-error.log \
  "app:create_app()" > /var/log/gunicorn-startup.log 2>&1 &

# Give it time to bind to the port
sleep 5

# Check if it's actually running
if pgrep -f gunicorn > /dev/null; then
  echo "Gunicorn started successfully (PID(s): $(pgrep -f gunicorn))"
else
  echo "ERROR: Gunicorn failed to start. Check logs:"
  tail -n 20 /var/log/gunicorn-startup.log
  tail -n 20 /var/log/gunicorn-error.log
  exit 1
fi

echo "Server startup script completed."