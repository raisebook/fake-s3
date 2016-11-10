FROM debian:jessie
MAINTAINER Raisebook <engineering@raisebook.com>

ENV DEBIAN_FRONTEND noninteractive

# install Ruby
RUN apt-get update && apt-get install -yqq ruby rubygems-integration build-essential

# install fake-s3
RUN gem build fakes3.gemspec
RUN gem install fakes3

# run fake-s3
RUN mkdir -p /fakes3_root
ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "4569"]
EXPOSE 4569
