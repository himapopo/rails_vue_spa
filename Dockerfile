FROM ruby:2.7.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    vim 

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler && bundle install