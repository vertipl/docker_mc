
FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java8-installer

ADD    ./minecraft/server.properties /data/
ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /data/
ADD    ./scripts/start /start

RUN     chmod +x /start
RUN     chmod +x /data/craftbukkit-1.7.2-R0.3.jar
RUN
expose 25565
volume ["/data"]
cmd    ["/start"]

