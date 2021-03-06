FROM ruby:3.0.2

RUN apt-get update && apt-get install -y \
  curl \
  postgresql-client \
  git \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

WORKDIR /app
COPY . /app

RUN gem install bundler:2.1.4
RUN bundle install

expose 3000