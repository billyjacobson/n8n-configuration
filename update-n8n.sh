#!/usr/bin/env bash
cd /home/billy_jacobson/n8n-compose
# Pull new images
docker pull n8nio/n8n:latest
docker compose pull
# Recreate and start containers
docker compose up --build -d

