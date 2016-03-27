#!/bin/bash

if [ ! -f /data/spigot.jar ]; then 
  cd /data/
  chown -R 6001:6001 ../
  cp /spigot.jar /data/spigot.jar
  cp /ops.txt /data/ops.txt
  cp /white-list.txt /data/white-list.txt
  cp /server.properties /data/server.properties

  #accept eola
  echo "eula=true" > /data/eula.txt
  chmod +x /data/spigot.jar

fi
cd /data/
java -Xms512M -Xmx1536M -XX:MaxPermSize=128M -jar spigot.jar
