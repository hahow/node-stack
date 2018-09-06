FROM node:boron

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 \
 && echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list \
 && apt-get update \
 && apt-get install -y mongodb-org=2.6.12 \
 && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
