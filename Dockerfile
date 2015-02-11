
FROM nimmis/java:openjdk-8-jdk
MAINTAINER nimmis <kjell.havneskold@gmail.com>
RUN apt-get update && apt-get install -y wget git && apt-get clean all

ADD    ./scripts/start.sh /start.sh
ADD    ./minecraft/ops.txt /ops.txt
ADD    ./minecraft/white-list.txt /white-list.txt
ADD    ./minecraft/server.properties /server.properties
ADD    ./minecraft/spigot.jar /spigot.jar

RUN     chmod +x /start.sh

EXPOSE 25565
VOLUME ["/data"]
CMD    ["/start.sh"]

