# Use the official n8n image as the base
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install ffmpeg and its dependencies
# Reinstall apk-tools since n8n removes it
RUN ARCH=$(uname -m) && \
    wget -qO- "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/" | \
    grep -o 'href="apk-tools-static-[^"]*\.apk"' | head -1 | cut -d'"' -f2 | \
    xargs -I {} wget -q "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/${ARCH}/{}" && \
    tar -xzf apk-tools-static-*.apk && \
    ./sbin/apk.static -X http://dl-cdn.alpinelinux.org/alpine/latest-stable/main \
        -U --allow-untrusted add apk-tools && \
    rm -rf sbin apk-tools-static-*.apk

# Now that 'apk' is back, use it to install ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# Switch back to the default user 'node' for security
USER node
