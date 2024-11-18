FROM debian:stable

MAINTAINER "me@zeauw.dev"

ENV DEBIAN_FRONTEND noninteractive

# imagemagick and elog
RUN apt-get update \
    && apt-get --yes install imagemagick ckeditor libssl-dev g++ make wget\
    && rm -rf /var/lib/apt/lists/* 

RUN apt-get clean 

RUN mkdir /make\
    && cd /make\
    && wget http://elog.psi.ch/elog/download/tar/elog-latest.tar.gz\
    && tar -xzf elog-latest.tar.gz\
    && cd elog-*\
    && make install

RUN cd /\
    && rm -rf make\
    && apt -y purge g++ make wget\
    && apt -y autoremove\
    && apt clean

# elog config
RUN mkdir /etc/elog
COPY ./elog.conf /etc/elog/elog.conf
RUN mkdir data

EXPOSE 8080

CMD ["bash", "-c", "if [ ! -e /data/elog.conf ]; then cp /etc/elog/elog.conf /data/; fi; mkdir -p /data/resource /data/logbook; elogd -p 8080 -c /data/elog.conf -s /data/resource -d /data/logbook"]
