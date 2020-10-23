FROM docker.elastic.co/logstash/logstash:7.9.2

USER root

RUN yum install -y epel-release && yum -y update yum install -y jq

USER logstash

RUN bin/logstash-plugin install logstash-input-exec && \
    bin/logstash-plugin install logstash-output-elasticsearch && \
    bin/logstash-plugin install logstash-codec-json_lines && \
    bin/logstash-plugin install logstash-codec-json

ADD kubectl bin/
ADD oc bin/
ADD list-object.sh bin/

ADD pipeline/* pipeline/