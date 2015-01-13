
FROM   ubuntu:14.04

env    DEBIAN_FRONTEND noninteractive

add    ./apt/sources.list /etc/apt/sources.list

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java8-installer
run	   apt-get --yes install curl supervisor pwgen

add    ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
add    ./supervisor/conf.d/minecraft.conf /etc/supervisor/conf.d/minecraft.conf
add    ./minecraft/ops.txt /usr/local/etc/minecraft/
add    ./minecraft/white-list.txt /usr/local/etc/minecraft/
add    ./minecraft/server.properties /usr/local/etc/minecraft/
add    ./minecraft/craftbukkit.jar /usr/local/etc/minecraft/
add    ./scripts/start /start

run	   chmod +x /start

expose 25565
volume ["/data"]
cmd    ["/start"]

