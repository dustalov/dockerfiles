FROM ruby:alpine

MAINTAINER Dmitry Ustalov <dmitry.ustalov@gmail.com>

RUN \
gem install bundler && \
apk add --no-cache libffi libxml2 libxslt && \
apk add --no-cache --virtual .gem-installdeps build-base libffi-dev libxml2-dev libxslt-dev && \
TEMP=$(mktemp -d) && \
echo "source 'https://rubygems.org'" > $TEMP/Gemfile && \
echo "gem 'github-pages', group: :jekyll_plugins" >> $TEMP/Gemfile && \
cd $TEMP && \
bundle config build.nokogiri --use-system-libraries && \
bundle install --system --jobs $(nproc) && \
rm -rf $GEM_HOME/cache $TEMP && \
apk del .gem-installdeps
