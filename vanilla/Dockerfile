FROM openjdk:alpine

LABEL maintainer="a@grin.ly"

ARG MURL=https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar
ARG MUSER=miner
ARG MHOME=/home/${MUSER}

ADD ["${MURL}", "${MHOME}/server.jar" ]
RUN adduser -D -u 1000 ${MUSER} && chown -R ${MUSER} ${MHOME}

USER ${MUSER}
WORKDIR ${MHOME}

RUN java -jar server.jar --installServer &&\
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt  &&\	
	echo \#$(date) >> eula.txt  &&\
	echo "eula=true" >> eula.txt

# VOLUME [${MHOME}/config]
# VOLUME [${MHOME}/world]
# VOLUME [${MHOME}/mods]

ADD --chown=miner:miner world.tar.gz ${MHOME}
ADD --chown=miner:miner ops.json ${MHOME}/ops.json
ADD --chown=miner:miner server.properties ${MHOME}/server.properties

EXPOSE 25565

CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]
