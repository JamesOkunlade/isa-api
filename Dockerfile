ARG ruby_version=3.0.2

FROM ruby:${ruby_version}-slim AS base

ENV BUNDLER_VERSION=2.3.9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git-core \
      build-essential \
      libpq-dev \
      sudo \
      curl

RUN gem install bundler -v 2.3.9

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./ 

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
