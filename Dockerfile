FROM ruby:2.6.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /jobbyjobjob
WORKDIR /jobbyjobjob

COPY Gemfile /jobbyjobjob/Gemfile
COPY Gemfile.lock /jobbyjobjob/Gemfile.lock

RUN bundle install

COPY . /jobbyjobjob
