# Use Ubuntu as the base image
FROM ubuntu:24.04

# Update the package lists and install required packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    pandoc \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    weasyprint

# Cleanup to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Set Environment variables
ENV PAGEBREAK_VERSION=v0.1.0
ENV PAGEBREAK_SHA256=6b26dae9ea6e757b1648ead78c39492734381d96d42da7bc1f30cea84485d832

# Download the pagebreak.lua script and validate against expected checksum
RUN curl --remote-name https://raw.githubusercontent.com/pandoc-ext/pagebreak/${PAGEBREAK_VERSION}/pagebreak.lua && \
    echo "${PAGEBREAK_SHA256} pagebreak.lua" | sha256sum -c -

COPY src/ /app/
RUN chmod +x /app/compile.sh

CMD [ "./compile.sh" ]
