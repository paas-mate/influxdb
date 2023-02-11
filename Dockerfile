FROM shoothzj/base

WORKDIR /opt

ARG TARGETARCH

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.6.1-linux-$TARGETARCH.tar.gz  && \
mkdir -p /opt/influxdb && \
tar -xf /opt/influxdb2-2.6.1-linux-$TARGETARCH.tar.gz -C /opt/influxdb --strip-components 1 && \
chown -R sh:sh /opt && \
rm -rf /opt/influxdb2-2.6.1-linux-$TARGETARCH.tar.gz && \
ln -s /opt/influxdb/influx /usr/bin/influx && \
ln -s /opt/influxdb/influxd /usr/bin/influxd

ENV INFLUX_HOME /opt/influxdb

WORKDIR /opt/influxdb
