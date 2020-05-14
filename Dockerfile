FROM node:14.2.0-alpine3.11

ADD . /node
WORKDIR /node

CMD sh
