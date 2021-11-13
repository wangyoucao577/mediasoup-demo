FROM node:14-bullseye 

# Install DEB dependencies and others.
RUN \
	set -x \
	&& apt-get update \
	&& apt-get install -y vim net-tools build-essential valgrind python3-pip 

WORKDIR /service

COPY . .
RUN mkdir -p server/certs

RUN cd server && npm install && cp config.example.js config.js 
RUN cd app && npm install 

# for shown on runtime
ARG IMAGE_TAG
ENV IMAGE_TAG ${IMAGE_TAG}
RUN echo IMAGE_TAG=${IMAGE_TAG} >> /etc/environment


ENTRYPOINT ["/bin/bash"]