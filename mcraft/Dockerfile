FROM openjdk:alpine

ARG FORGE_VER=1.7.10-10.13.4.1614-1.7.10
ARG FORGE_INST=forge-${FORGE_VER}-installer.jar

ENV FORGE_UNI=forge-${FORGE_VER}-universal.jar

WORKDIR /server

ADD http://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VER}/${FORGE_INST} /server/
COPY ops.json /server/ops.json
ADD world.tar.gz /server
ADD mods.tar.gz /server
ADD config.tar.gz /server

RUN java -jar ${FORGE_INST} --installServer &&\
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt  &&\
	echo \#$(date) >> eula.txt  &&\
	echo "eula=true" >> eula.txt

VOLUME [/server/config]
VOLUME [/server/world]
VOLUME [/server/mods]

EXPOSE 25565

#CMD [ "java", "-Xmx1024M -Xms1024M -jar ${FORGE_UNI} nogui" ]
CMD java -Dfml.queryResult=confirm -jar ${FORGE_UNI} nogui
