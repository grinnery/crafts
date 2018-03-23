#!/bin/bash

mkdir -p server 
rm -rf server/*

cd server

FORGE_VER=1.7.10-10.13.4.1614-1.7.10
FORGE_INST=forge-${FORGE_VER}-installer.jar
FORGE_UNI=forge-${FORGE_VER}-universal.jar
wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VER}/${FORGE_INST}
java -jar ${FORGE_INST} --installServer

echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt
echo \#$(date) >> eula.txt
echo "eula=true" >> eula.txt

unzip ../mods.zip
unzip ../world.zip

java -Xmx1024M -Xms1024M -jar ${FORGE_UNI} nogui
