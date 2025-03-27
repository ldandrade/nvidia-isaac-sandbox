#!/bin/bash

echo "📦 Installing dependencies..."
sudo apt-get update && sudo apt-get install -y curl jq

echo "🐳 Setting up Docker-in-Docker..."
sudo service docker start

echo "📥 Pulling NVIDIA Isaac Mission Containers..."
docker pull nvcr.io/nvidia/isaac/mission_dispatch:latest
docker pull nvcr.io/nvidia/isaac/mission_database:latest
docker pull nvcr.io/nvidia/isaac/mission_simulator:latest

echo "🚀 Starting MQTT Broker..."
docker run -d -p 1883:1883 --name mosquitto eclipse-mosquitto

echo "🛠️ Deploying Isaac Mission Services..."
docker run -d --name mission_dispatch -p 5000:5000 nvcr.io/nvidia/isaac/mission_dispatch:latest
docker run -d --name mission_database -p 5432:5432 nvcr.io/nvidia/isaac/mission_database:latest
docker run -d --name mission_simulator -p 3000:3000 nvcr.io/nvidia/isaac/mission_simulator:latest

echo "✅ Deployment completed!"
