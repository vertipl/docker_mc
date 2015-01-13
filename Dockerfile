
from   ubuntu:12.04

env    DEBIAN_FRONTEND noninteractive

add    ./apt/sources.list /etc/apt/sources.list
run    apt-get --yes update; apt-get --yes upgrade
run	   apt-get --yes install curl openjdk-7-jre-headless supervisor pwgen

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

