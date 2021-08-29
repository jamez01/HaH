FROM node:8

# Create app directory
WORKDIR /usr/src/app

ENV PORT=80
ENV BASE_URL=http://troyk88.openode.io/

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY build.js ./
COPY client ./client
COPY decks ./decks
COPY icon ./icon
COPY models ./models
COPY server ./server

RUN npm run build

EXPOSE 7878/tcp
CMD [ "npm", "start" ]