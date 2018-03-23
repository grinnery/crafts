FROM openjdk:alpine

RUN apk update && apk add ca-certificates wget && update-ca-certificates && rm -rf /var/cache/apk/*

WORKDIR /server
RUN wget -q https://addons-origin.cursecdn.com/files/2481/284/FTBPresentsSkyfactory3Server_3.0.15.zip -O server.zip &&\
	unzip server.zip &&\
	rm server.zip &&\
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt  &&\
	echo \#$(date) >> eula.txt  &&\
	echo "eula=true" >> eula.txt &&\
	chmod +x ServerStart.sh &&\
	chmod +x FTBInstall.sh &&\
	./FTBInstall.sh

COPY ops.json /server/ops.json

VOLUME [/server/config]
VOLUME [/server/world]

EXPOSE 25565

CMD ./ServerStart.sh
