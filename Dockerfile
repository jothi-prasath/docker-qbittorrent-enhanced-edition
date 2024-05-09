FROM lsiobase/alpine:edge as builder
LABEL maintainer="Jothi Prasath <jothiprasath2@gmail.com>"

WORKDIR /qbittorrent

COPY install.sh /qbittorrent/
COPY ReleaseTag /qbittorrent/

RUN  apk add --no-cache ca-certificates curl

RUN cd /qbittorrent \
	&& chmod a+x install.sh \
	&& bash install.sh

# docker qBittorrent-Enhanced-Edition

FROM lsiobase/alpine:edge

# environment settings
ENV TZ=Asia/Kolkata
ENV WEBUIPORT=8080
ENV HOME="/config" \
XDG_CONFIG_HOME="/config" \
XDG_DATA_HOME="/config"

# add local files and install qbitorrent
COPY root /
COPY --from=builder  /qbittorrent/qbittorrent-nox   /usr/local/bin/qbittorrent-nox

# install python3
RUN  apk add --no-cache python3 \
&&   rm -rf /var/cache/apk/*   \
&&   chmod a+x  /usr/local/bin/qbittorrent-nox  

# ports and volumes
VOLUME /config
EXPOSE 8080  6881  6881/udp