FROM ubuntu:xenial

MAINTAINER simota <simota@me.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y curl default-jre default-jdk && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y build-essential nodejs && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
