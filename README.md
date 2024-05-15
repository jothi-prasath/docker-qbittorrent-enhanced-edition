# qBittorrent Enhanced Edition

![logo](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/New_qBittorrent_Logo.svg/240px-New_qBittorrent_Logo.svg.png)

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/jothi-prasath/docker-qbittorrent-enhanced-edition/Auto%20Build%20Docker%20Image.yml)](https://github.com/jothi-prasath/docker-qbittorrent-enhanced-edition/actions/workflows/Auto%20Build%20Docker%20Image.yml)
[![Docker Image Version](https://img.shields.io/docker/v/jothiprasath2/qbittorrent-enhanced-edition)](https://hub.docker.com/r/jothiprasath2/qbittorrent-enhanced-edition) <br>

Github: https://github.com/jothi-prasath/docker-qbittorrent-enhanced-edition <br>
Docker Hub: https://hub.docker.com/r/jothiprasath2/qbittorrent-enhanced-edition <br>

## Features

* Auto Ban Xunlei, QQ, Baidu, Xfplay, DLBT and Offline downloader
* Auto Ban Unknown Peer from China Option (Default: OFF)
* Auto Update Public Trackers List (Default: OFF)
* Auto Ban BitTorrent Media Player Peer Option (Default: OFF)
* Peer whitelist/blacklist
* Dark theme

Thanks to the following projects:

* https://github.com/qbittorrent/qBittorrent
* https://github.com/c0re100/qBittorrent-Enhanced-Edition
* https://github.com/ngosang/trackerslist
* https://github.com/SuperNG6/Docker-qBittorrent-Enhanced-Edition


## Architecture

| Architecture | Tag            |
| ------------ | -------------- |
| x86-64       | latest   |
| arm64        | latest |

## Usage
### docker-compose

```
---
services:
  qbittorrentee:
    image: jothiprasath2/qbittorrent-enhanced-edition:latest
    container_name: qbittorrent-enhanced-edition
    environment:
      - PUID=1000
      - PGID=100
      - TZ=Asia/Kolkata
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 6881:6881
      - 6881:6881/udp
      - 8080:8080
    restart: unless-stopped
```

### docker cli 

```
docker run -d \
    --name=qbittorrent-enhanced-edition  \
    -e WEBUIPORT=8080  \
    -e PUID=1000 \
    -e PGID=100 \
    -e TZ=Asia/Kolkata \
    -p 6881:6881  \
    -p 6881:6881/udp  \
    -p 8080:8080  \
    -v /path/to/appdata/config:/config  \
    -v /path/to/downloads:/downloads  \
    --restart unless-stopped  \
    jothiprasath2/qbittorrent-enhanced-edition:latest
```

## Parameters

| Parameter     | Function            |
| ------------  | -------------- |
| -p 8080       | WebUI   |
| -p 6881       | tcp connection port   |
| -p 6881/udp   | udp connection port   |
| -e TZ=Asia/Kolkata   | specify a timezone to use  |
