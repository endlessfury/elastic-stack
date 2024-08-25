FROM bitnami/fluentd:1.17.1-debian-12-r0
USER root
RUN gem install elasticsearch -v 7.10
RUN gem install elasticsearch-transport -v 7.10
RUN gem install elasticsearch-xpack -v 7.10
RUN gem install elasticsearch-api -v 7.10
RUN gem uninstall fluent-plugin-elasticsearch
RUN gem install fluent-plugin-elasticsearch -v 4.3.1
RUN gem install fluent-plugin-rewrite-tag-filter
RUN gem install fluent-plugin-multi-format-parser
RUN gem uninstall elasticsearch -v '>8.0.0'
RUN gem uninstall elasticsearch-api -v '>8.0.0'
RUN gem uninstall elasticsearch-xpack -v '7.17.11'
USER 1001
