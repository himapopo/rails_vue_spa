FROM node:14.5.0

RUN apt-get update -qq && apt-get -y install \
    && npm install -g npm && \
    npm install -g @vue/cli

RUN mkdir /frontend

WORKDIR /frontend

COPY package.json ./frontend/package.json
COPY package-lock.json ./frontend/package-lock.json

RUN npm install