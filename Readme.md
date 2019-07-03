# A Simple Local Development Environment for CSS Development Using Semantic-Ui

I would like to use [semantic-ui](https://semantic-ui.com/) in my project.

What I need are

1. don't want install nodejs locally

2. install semantic-ui locally
  
3. browser should automatically refresh when HTML, CSS and Javascript files change

The first two requirements can be fulfilled easily by using Docker.

The Dockerfile to create the image is:

``` Dockerfile
FROM node:lts-alpine
RUN apk update && apk upgrade
RUN npm install -g gulp
RUN mkdir /app
WORKDIR /app
```

Build the image with a tag semantic-ui.

The command to run the container is:

``` shell
docker run -it --rm \
-v $(pwd):/app \
--user $(id -u):$(id -g) \
semantic-ui /bin/sh
```

This shell script mount the current working directory to /app in the container, and login into the container as the same user in the same group in the host.

Run the [installation command](https://semantic-ui.com/introduction/getting-started.html) to install semantic-ui.

Using browser-sync to fulfill the third requirement is easy. Please read [A Very Basic Browser-Sync Development Environment Based on Docker](https://medium.com/@acncuc/a-very-basic-browser-sync-development-environment-based-on-docker-568e7a0c8c0f?source=friends_link&sk=14dd350203d90b19e51d3ee6be09f840) for more detail.

However there is one important point. You may run into an error cast by browser-sync that says the number of watched files exceeds the limit. The solution is to tell browser-sync to ignore directories where too many files resides.
An example shell script is:
```shell
docker run -it --rm \
-v $(pwd):/app \
-p 3000:3000 \
browser-sync \
browser-sync start \
--server \
--files \"*.html, *.js, *.css,css/*.css, js/*.js\" \
--ignore 'semantic' 'node_modules' \
--no-open false
```
Don't need to escape the single quotes after the --ignore option. This took me an hour to fix. :).
