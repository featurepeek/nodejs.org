FROM mhart/alpine-node:10.15

# force production when built from Docker
ENV NODE_ENV production

# Create directories all the way up to app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# open port
EXPOSE 8080

CMD [ "node", "server.js" ]
