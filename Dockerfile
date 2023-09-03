# Use an official Node.js image as the base
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

EXPOSE 8000

# Define the command to run your application
CMD ["node", "app.js"]
