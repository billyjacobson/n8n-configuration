#!/usr/bin/env bash
cd /home/billy_jacobson/n8n
# Pull new images
docker pull n8nio/n8n:latest
docker compose pull
# Recreate and start containers
docker compose down
docker compose up --build -d
