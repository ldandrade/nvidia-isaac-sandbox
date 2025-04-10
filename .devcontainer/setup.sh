#!/bin/bash

echo "⏳ Waiting for Docker to become available..."
until docker info > /dev/null 2>&1; do
    sleep 1
done

echo "🐳 Docker is ready. Starting services..."
docker-compose up -d
