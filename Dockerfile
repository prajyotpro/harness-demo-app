FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
COPY ecosystem.config.js /usr/src/app/ecosystem.config.js
RUN npm install \ 
    && npm install pm2@latest -g

# Bundle app source
COPY . .

EXPOSE 3000
CMD ["pm2-runtime", "ecosystem.config.js"]
