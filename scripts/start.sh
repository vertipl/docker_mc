#!/bin/bash

if [ ! -f /data/spigot.jar ]; then 
  echo "Building spigot jar file, be patient"
  mkdir -p /data/build
  cd /data/build
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  HOME=/data/build java -jar BuildTools.jar
  cp /data/build/Spigot/Spigot-Server/target/spigot-1.8*.jar /data/spigot.jar

  #accept eola
  echo "eula=true" > /data/eula.txt

fi
cd /data/
java -Xms512M -Xmx1536M -XX:MaxPermSize=128M -jar spigot.jar