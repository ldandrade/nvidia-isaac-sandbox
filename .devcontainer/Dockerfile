# Use an Ubuntu-based image with Docker-in-Docker support
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install Docker (inside the container)
RUN apt-get update && \
    apt-get install -y --no-install-recommends docker.io && \
    rm -rf /var/lib/apt/lists/*

# Expose ports for communication
EXPOSE 5000 5432 3000
