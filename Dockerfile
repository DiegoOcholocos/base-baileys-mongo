FROM node:18-bullseye as bot

WORKDIR /app

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application files
COPY . .

# Set environment variables
ARG RAILWAY_STATIC_URL
ARG PUBLIC_URL
ARG PORT

# Set the default command to start the application
CMD ["npm", "start"]