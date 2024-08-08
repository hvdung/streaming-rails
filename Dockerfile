FROM rubylang/ruby:3.3-jammy
SHELL ["/bin/bash", "-c"]
ENV BUNDLER_VERSION=2.5.17

RUN apt-get update
RUN apt-get install -y build-essential libyaml-dev

RUN gem install bundler -v $BUNDLER_VERSION

RUN mkdir /root/.ssh
WORKDIR /video_streaming
