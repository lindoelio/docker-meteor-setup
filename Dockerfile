FROM ubuntu:18.04

LABEL maintainer="lindoelio@gmail.com"

RUN echo "Installing Pre-requisites..." \
  && apt-get update -qq && apt-get install -q -y curl gnupg apt-utils

RUN echo "Installing Node.js..." \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get update -qq && apt-get install -q -y nodejs

RUN echo "Installing Meteor..." \
  && curl https://install.meteor.com/ | sh

RUN apt-get autoremove -qq -y \
  && apt-get clean -qq -y \
  && apt-get autoclean -qq -y

ENV METEOR_ALLOW_SUPERUSER=true
