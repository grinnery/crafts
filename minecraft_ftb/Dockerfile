FROM openjdk:alpine

RUN apk update && apk add ca-certificates wget && update-ca-certificates && rm -rf /var/cache/apk/*

WORKDIR /server
RUN wget -q https://minecraft.curseforge.com/projects/sevtech-ages/files/2545731/download -O server.zip &&\
	unzip server.zip &&\
	plz run "forge-1.12.2-14.23.2.2635-installer.jar"
	rm server.zip
	

COPY ops.json /server/ops.json

VOLUME [/server/config]
VOLUME [/server/world]

EXPOSE 25565

CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.1.12.2.jar", "nogui" ]
