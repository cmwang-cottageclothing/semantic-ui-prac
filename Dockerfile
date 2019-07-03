FROM node:lts-alpine
RUN apk update && apk upgrade
RUN npm install -g gulp
RUN mkdir /app
WORKDIR /app