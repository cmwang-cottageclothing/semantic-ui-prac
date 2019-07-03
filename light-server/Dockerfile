FROM node:lts-alpine
RUN apk update && apk upgrade
RUN npm install -g light-server
RUN mkdir /app
WORKDIR /app
CMD [ "light-server", "-s", ".", "-p", "8080", "-w", "*.html, *.css # # reload" ]
EXPOSE 8080