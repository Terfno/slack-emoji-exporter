FROM node:14.2.0-alpine3.11

WORKDIR /node

COPY . .
RUN npm install

CMD node index.js
