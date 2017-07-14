FROM ubuntu:14.04

MAINTAINER Quan Do <thienkimlove@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY my.cnf /etc/mysql/my.cnf

RUN apt-get update \
    && apt-get install -y  software-properties-common \
    && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA \
    && add-apt-repository 'deb http://releases.galeracluster.com/ubuntu trusty main' \
    && apt-get update \
    && apt-get install -y galera-3 galera-arbitrator-3 mysql-wsrep-5.6 rsync lsof

RUN echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'tieungao';" >/etc/mysql/init

EXPOSE 3306

USER mysql

ENTRYPOINT ["mysqld"]