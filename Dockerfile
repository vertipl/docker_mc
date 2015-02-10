
FROM nimmis/java:openjdk-8-jdk
MAINTAINER nimmis <kjell.havneskold@gmail.com>
RUN apt-get update && apt-get install -y wget git && apt-get clean all

ADD    ./scripts/start.sh /start.sh

RUN     chmod +x /start.sh
RUN     chmod +x /data/craftbukkit-1.7.2-R0.3.jar
EXPOSE 25565
VOLUME ["/data"]
CMD    ["/start.sh"]

