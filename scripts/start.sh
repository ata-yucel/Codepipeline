#!/bin/bash
set -e

echo ">>> [CodeDeploy] Running start.sh..."

APP_DIR="/home/ec2-user/simple-node-app"
APP_LOG="$APP_DIR/app.log"
APP_NAME="app.js"

cd "$APP_DIR" || exit 1


echo ">>> Killing any existing Node.js process..."
pkill -f "$APP_NAME" || true


echo ">>> Starting application..."
nohup node "$APP_NAME" > "$APP_LOG" 2>&1 &

echo ">>> Application started successfully."