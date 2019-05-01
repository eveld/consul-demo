FROM prom/statsd-exporter:latest
FROM nicholasjackson/emojify-api:v0.9.8

RUN apk add --update bash supervisor curl vim
RUN sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

RUN mkdir -p /etc/supervisor.d/
COPY emojify-api/api.ini /etc/supervisor.d/

RUN mkdir -p /etc/consul
COPY client.hcl /etc/consul/

COPY consul /usr/local/bin/consul
COPY envoy /usr/local/bin/envoy

RUN sed -i 's/;nodaemon=false/nodaemon=true/g' /etc/supervisord.conf

COPY --from=0 /bin/statsd_exporter /bin/statsd_exporter

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]