# Use the official n8n image as the base
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install ffmpeg and its dependencies
# The official n8n image uses Alpine Linux, so 'apk add' is correct.
RUN apk add --no-cache ffmpeg

# Switch back to the default user 'node' for security
USER node
