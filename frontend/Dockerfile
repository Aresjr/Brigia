FROM node:18-alpine

WORKDIR /app

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose port for Vite
EXPOSE 8080

# Default command
CMD ["npm", "run", "dev"]