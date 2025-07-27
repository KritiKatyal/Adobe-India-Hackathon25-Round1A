# Use Python 3.11 slim image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Create and set working directory
WORKDIR /app

# Copy only necessary files
COPY requirements.txt main.py ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the entrypoint (with explicit path)
ENTRYPOINT ["python", "/app/main.py"]