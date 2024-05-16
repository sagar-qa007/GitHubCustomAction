# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    python3-requests \
    python3-venv \
    python3-full \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable to prevent externally managed environment error
ENV PIP_NO_EXTERNAL_ENVIRONMENT=true

# Install PyYAML using pip
RUN pip3 install PyYAML

# Copy feed.py to /usr/bin/
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh to / and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
