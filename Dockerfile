
FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

ADD    ./apt/sources.list /etc/apt/sources.list
RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections  && \
       apt-get --yes install oracle-java8-installer
RUN	apt-get --yes install curl supervisor pwgen

ADD    ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD    ./supervisor/conf.d/minecraft.conf /etc/supervisor/conf.d/minecraft.conf
ADD    ./minecraft/ops.txt /usr/local/etc/minecraft/
ADD    ./minecraft/white-list.txt /usr/local/etc/minecraft/
ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
ADD    ./minecraft/craftbukkit.jar /usr/local/etc/minecraft/
ADD    ./scripts/start /start

RUN	   chmod +x /start

expose 25565
volume ["/data"]
cmd    ["/start"]

