#!/bin/bash

echo "🛠️ Deploying Isaac Mission Services..."

# Authenticate to NVIDIA NGC (only if needed)
if [ -n "$NGC_API_KEY" ]; then
    echo "$NGC_API_KEY" | docker login nvcr.io -u '$oauthtoken' --password-stdin
fi

# Pull images
docker pull nvcr.io/nvidia/isaac/mission-dispatch:3.2.0
docker pull nvcr.io/nvidia/isaac/mission-database:3.2.0
docker pull nvcr.io/nvidia/isaac/mission-simulator:3.2.0

# Start containers
docker run -d --name mission_dispatch -p 5000:5000 nvcr.io/nvidia/isaac/mission-dispatch:3.2.0
docker run -d --name mission_database -p 5432:5432 nvcr.io/nvidia/isaac/mission-database:3.2.0
docker run -d --name mission_simulator -p 3000:3000 nvcr.io/nvidia/isaac/mission-simulator:3.2.0

echo "✅ Isaac Mission Services deployed successfully!"
