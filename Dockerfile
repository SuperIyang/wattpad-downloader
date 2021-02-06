# The Base Image used to create this Image
FROM node:lts

# Upgrade
RUN apt update -y && apt upgrade -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*

# Create app directory, copy files and change workdir
RUN mkdir -p /app
COPY . /app
WORKDIR /app

# Tell docker to expose the application port
EXPOSE 2200

# Install dependencies
RUN npm install

# The Base command, This command should be used to start the container
# Remember, A Container is a Process.As long as the base process (started by base cmd) is live the Container will be ALIVE.
CMD ["npm", "start"]