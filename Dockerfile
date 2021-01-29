# -*- coding: utf-8, tab-width: 2 -*-

FROM ubuntu:focal
COPY . /opt/lcsg/
ENTRYPOINT ["/opt/lcsg/entrypoint.sh"]
