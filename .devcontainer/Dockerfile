# Use an Ubuntu-based image with Docker-in-Docker support
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install Docker (inside the container)
RUN apt-get update && \
    apt-get install -y --no-install-recommends docker.io && \
    rm -rf /var/lib/apt/lists/*

# Authenticate to NVIDIA NGC (API key must be provided as an ARG or ENV)
# ARG NGC_API_KEY
# RUN echo "$NGC_API_KEY" | docker login nvcr.io -u '$oauthtoken' --password-stdin

# Pull Isaac Mission containers
RUN docker pull nvcr.io/nvidia/isaac/mission-dispatch:3.2.0 && \
    docker pull nvcr.io/nvidia/isaac/mission-database:3.2.0 && \
    docker pull nvcr.io/nvidia/isaac/mission-simulator:3.2.0

# Expose ports for communication
EXPOSE 5000 5432 3000

# Start services when the container launches
CMD ["/bin/bash", "-c", "docker run -d --name mission_dispatch -p 5000:5000 nvcr.io/nvidia/isaac/mission-dispatch:3.2.0 && \
                         docker run -d --name mission_database -p 5432:5432 nvcr.io/nvidia/isaac/mission-database:3.2.0 && \
                         docker run -d --name mission_simulator -p 3000:3000 nvcr.io/nvidia/isaac/mission-simulator:3.2.0 && \
                         tail -f /dev/null"]
