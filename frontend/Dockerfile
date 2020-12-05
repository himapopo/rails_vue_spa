FROM node:14.5.0

RUN apt-get update -qq && apt-get -y install \
    && npm install -g npm && \
    npm install -g @vue/cli

RUN mkdir /frontend

WORKDIR /frontend