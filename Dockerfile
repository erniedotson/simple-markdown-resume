# Use Ubuntu as the base image
FROM ubuntu:24.04

# Update the package lists and install required packages
RUN apt-get update && \
    apt-get install -y \
    pandoc \
    weasyprint

# Cleanup to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/ /app/
RUN chmod +x /app/compile.sh

CMD [ "./compile.sh" ]
