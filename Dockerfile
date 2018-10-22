FROM ruby:2.5.1-stretch
MAINTAINER BEAU Sébastien <sebastien.beau@akretion.com>
USER root
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y libicu-dev python-docutils vim && \
    apt-get clean
RUN mkdir -p /workspace
WORKDIR /workspace
ADD . /workspace
RUN bundle install
CMD bundle exec gollum --config config.rb --allow-uploads page --template-dir /workspace/templates --css --base-path wiki
EXPOSE 4567
