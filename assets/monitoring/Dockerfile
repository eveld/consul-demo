FROM grafana/grafana:6.1.4
FROM prom/prometheus:v2.9.2
FROM alpine

RUN apk add --update bash supervisor curl vim
RUN sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

RUN mkdir -p /etc/supervisor.d/
COPY monitoring/prometheus.ini /etc/supervisor.d/

RUN sed -i 's/;nodaemon=false/nodaemon=true/g' /etc/supervisord.conf

RUN mkdir -p /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Grafana
COPY --from=0 /etc/grafana /etc/grafana
COPY --from=0 /var/lib/grafana /var/lib/grafana
COPY --from=0 /usr/share/grafana /usr/share/grafana
COPY --from=0 /run.sh /bin/grafana

ENV PATH="$PATH:/usr/share/grafana/bin" \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

COPY monitoring/datasource.yml /etc/grafana/provisioning/datasources/
COPY monitoring/dashboards.yml /etc/grafana/provisioning/dashboards/
COPY monitoring/dashboards/ /var/lib/grafana/dashboards/

# Prometheus
RUN mkdir -p /etc/prometheus
COPY --from=1 /bin/prometheus /bin/promtool /bin/
COPY --from=1 /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles /usr/share/prometheus/

RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/

COPY monitoring/grafana.ini /etc/grafana/
COPY monitoring/prometheus.yml /etc/prometheus/

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]