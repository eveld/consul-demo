FROM prom/statsd-exporter:latest
FROM alpine

RUN apk add --update bash supervisor curl vim
RUN sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

RUN mkdir -p /etc/supervisor.d/
COPY consul-server/consul.ini /etc/supervisor.d/

RUN mkdir -p /etc/consul/
COPY consul /usr/local/bin/consul

RUN sed -i 's/;nodaemon=false/nodaemon=true/g' /etc/supervisord.conf

COPY --from=0 /bin/statsd_exporter /bin/statsd_exporter

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]