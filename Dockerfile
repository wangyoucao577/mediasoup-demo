FROM node:14-bullseye 

# Install DEB dependencies and others.
RUN \
	set -x \
	&& apt-get update \
	&& apt-get install -y net-tools build-essential valgrind python3-pip 

WORKDIR /service

COPY . .

RUN cd server && npm install && cp config.example.js config.js 
RUN cd app && npm install 

