FROM akretion/voodoo-ruby:latest
MAINTAINER BEAU Sébastien <sebastien.beau@akretion.com>
USER root
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y libicu-dev python-docutils && \
    apt-get clean
ADD . /workspace
RUN bundle install
USER ubuntu
CMD bundle exec gollum --config config.rb --allow-uploads page --template-dir templates --css --base-path wiki
EXPOSE 4567
