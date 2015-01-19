
FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    apt-get --yes install default-jre
RUN	apt-get --yes install curl supervisor pwgen

ADD    ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD    ./supervisor/conf.d/minecraft.conf /etc/supervisor/conf.d/minecraft.conf
ADD    ./minecraft/ops.txt /usr/local/etc/minecraft/
ADD    ./minecraft/white-list.txt /usr/local/etc/minecraft/
ADD    ./minecraft/server.properties /usr/local/etc/minecraft/
ADD    ./minecraft/craftbukkit-1.7.2-R0.3.jar /usr/local/etc/minecraft/
ADD    ./scripts/start /start

RUN	   chmod +x /start

expose 25565
volume ["/data"]
cmd    ["/script"]

