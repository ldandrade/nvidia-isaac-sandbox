#!/bin/bash
set -e

echo "🔧 Updating pip..."
python3 -m pip install --upgrade pip

echo "📦 Installing requirements..."
if [ -f "/workspaces/$(basename "$LOCAL_WORKSPACE_FOLDER")/requirements.txt" ]; then
  pip install -r /workspaces/$(basename "$LOCAL_WORKSPACE_FOLDER")/requirements.txt
else
  echo "⚠️ requirements.txt not found. Skipping package install."
fi

echo "🐳 Bringing up docker-compose..."
docker-compose up -d || echo "⚠️ docker-compose failed to start. Check Docker daemon status."

echo "✅ Post-create tasks complete."
