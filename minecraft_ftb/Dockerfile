FROM openjdk:alpine

RUN apk update && apk add ca-certificates wget && update-ca-certificates && rm -rf /var/cache/apk/*

WORKDIR /server
RUN wget -q https://minecraft.curseforge.com/projects/project-ozone-2-reloaded/files/2509703/download -O server.zip &&\
	unzip server.zip &&\
	rm server.zip

COPY ops.json /server/ops.json

VOLUME [/server/config]
VOLUME [/server/world]

EXPOSE 25565

CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "forge.jar", "nogui" ]
