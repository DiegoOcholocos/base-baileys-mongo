FROM node:18-bullseye as bot

WORKDIR /app

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm ci

# Copy the rest of the application files
COPY . .

# Set environment variables
ARG RAILWAY_STATIC_URL
ARG PUBLIC_URL
ARG PORT

# Set proper permissions
RUN chown -R node:node /app

# Switch to a non-root user
USER node

# Start the application
CMD ["npm", "start"]