FROM ubuntu:14.04


#install
RUN apt-get update
RUN apt-get -y install git ruby  ruby-dev gcc make wget  python
RUN git clone  https://github.com/fluent/fluentd.git
RUN gem install fluentd
RUN gem install fluent-plugin-s3
RUN mkdir -p  /data/log
RUN fluentd --setup /data/fluent
COPY fluent/fluent.conf /data/fluent/fluent.conf

#install supervisor
RUN wget https://pypi.python.org/packages/source/s/setuptools/setuptools-19.2.tar.gz#md5=78353b1f80375ca5e088f4b4627ffe03
RUN tar -xzvf setuptools-19.2.tar.gz
WORKDIR setuptools-19.2
RUN python setup.py install
RUN easy_install supervisor
COPY fluent/supervisord.conf /data/fluent/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]