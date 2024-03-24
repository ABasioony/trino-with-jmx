FROM trinodb/trino:latest

RUN mkdir -p /usr/lib/trino/lib/jmx

COPY ./config.yaml   /usr/lib/trino/lib/jmx/config.yaml

COPY ./jmx_prometheus_javaagent-0.20.0.jar /usr/lib/trino/lib/jmx_prometheus_javaagent.jar

ENV EXTRA_ARGS="-javaagent:/usr/lib/trino/lib/jmx_prometheus_javaagent.jar=9081:/usr/lib/trino/lib/jmx/config.yaml"
