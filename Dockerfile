FROM debian:jessie

MAINTAINER Paul Andrew Liljenberg letters@paulnotcom.se

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -qqy install \
	git-core \
	gcc \
	python \
	python-dev \
	python-pip

RUN git clone https://github.com/progrium/keychain.io.git

WORKDIR /keychain.io
RUN pip install -r ./requirements.txt

ENV PORT 80

EXPOSE 80

CMD python -m keychain
