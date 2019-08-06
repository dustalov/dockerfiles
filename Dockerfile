FROM ruby:alpine

MAINTAINER Dmitry Ustalov <dmitry.ustalov@gmail.com>

RUN \
gem update bundler && \
apk add --no-cache libffi libxml2 libxslt && \
apk add --no-cache --virtual .gem-installdeps build-base libffi-dev libxml2-dev libxslt-dev && \
gem install github-pages -- --use-system-libraries && \
rm -rf $GEM_HOME/cache && \
apk del .gem-installdeps
