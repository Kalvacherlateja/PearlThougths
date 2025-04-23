# Use a more secure Node.js LTS base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application
COPY . .

# Build the Strapi admin panel
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start the Strapi app
CMD ["npm", "start"]
