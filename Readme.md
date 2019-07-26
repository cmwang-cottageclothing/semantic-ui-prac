# A Docker Image for CSS Development Using Semantic-UI

You may not want to install Nodejs just for CSS development with [semantic-ui](https://semantic-ui.com/). This simple Docker image is all you need.

Features of this image are:

1. no need to install nodejs locally

2. install semantic-ui locally

The Dockerfile to create the image is:

``` Dockerfile
FROM node:lts-alpine
RUN apk update && apk upgrade
RUN npm install -g gulp
RUN mkdir /app
WORKDIR /app
```

Build the image with a appropriate tag. The tag used here is `semantic-ui`.

The command to run the container is:

``` shell
docker run -it --rm \
-v $(pwd):/app \
--user $(id -u):$(id -g) \
semantic-ui /bin/sh
```

This shell script mount the current working directory to `/app` in the container, and login into the container as the same user in the same group in the host to prevent from permission issues.

Run the [installation command](https://semantic-ui.com/introduction/getting-started.html) to install semantic-ui, after get in the container.

For automatically refreshing pages during development, please read [A Very Basic Browser-Sync Development Environment Based on Docker](https://medium.com/@acncuc/a-very-basic-browser-sync-development-environment-based-on-docker-568e7a0c8c0f?source=friends_link&sk=14dd350203d90b19e51d3ee6be09f840) for more detail.

There is one important point. You may run into an error cast by browser-sync that says _the number of watched files exceeds the limit_. The solution is to tell browser-sync to ignore directories where too many files resides.

An example shell script is:

```shell
docker run -it --rm \
-v $(pwd):/app \
-p 3000:3000 \
browser-sync \
browser-sync start \
--server \
--files \"*.html, *.js, *.css, css/*.css, js/*.js\" \
--ignore 'semantic' 'node_modules' \
--no-open false
```

Don't need to escape the single quotes after the --ignore option. This took me an hour to fix. :).

If you want to use an alias to run the script, please prepends a back slash `/` to `$(pwd)`. That is `\$(pwd)`.
