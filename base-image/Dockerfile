FROM ubuntu:xenial
MAINTAINER Azat Khadiev <anuriq@gmail.com>

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    JRE_HOME=/usr/lib/jvm/java-8-oracle/jre

RUN apt-get update && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean
RUN echo "\nJRE_HOME=\"/usr/lib/jvm/java-8-oracle\"\n" >> /etc/environment

CMD ["/bin/bash"]
