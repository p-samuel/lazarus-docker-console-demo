# Use a base image with Linux and the required CPU family
FROM ubuntu:20.04

# Install necessary dependencies (if any)
RUN apt-get update && apt-get install -y \
    libgtk2.0-0 \
    libgdk-pixbuf2.0-0 \
    libpango-1.0-0 \
    libglib2.0-0 \
    libcairo2 \
    && apt-get clean

# Copy the compiled binary to the container
COPY SimpleConsole /app/SimpleConsole

# Set the working directory
WORKDIR /app

# Define the command to run the application
CMD ["./SimpleConsole"]
