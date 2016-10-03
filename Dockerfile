FROM camptocamp/collectd:0.1.2

MAINTAINER Marc Fournier <marc.fournier@camptocamp.com>

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libjemalloc1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY /collectd.conf /etc/collectd/collectd.conf.d/statsd.conf
ENV LD_PRELOAD "/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"

EXPOSE 8125/udp
