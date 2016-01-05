#!/bin/bash
#/var/log/httpd   这个目录是监控日志的目录
#/tmp/fluentd   这个目录是docker中产生日志的文件
docker run -tid --name fluentd  -v /var/log/httpd:/data/log:ro -v /tmp/fluentd:/tmp fluentd:v1