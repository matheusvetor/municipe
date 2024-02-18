FROM ruby:3.3.0-alpine

RUN apk --update --no-cache add build-base nodejs git zsh curl tzdata postgresql-dev \
                     postgresql-client libxslt-dev libxml2-dev imagemagick \
                     sqlite-dev libffi-dev fontconfig vips-dev

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler && bundle install
