#!/usr/bin/with-contenv bash

# Check CPU architecture
ARCH=$(uname -m)

echo -e "${INFO} Check CPU architecture ..."
if [[ ${ARCH} == "x86_64" ]]; then
    ARCH="qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
elif [[ ${ARCH} == "armv7l" ]]; then
    ARCH="qbittorrent-enhanced-nox_arm-linux-musleabi_static.zip"
elif [[ ${ARCH} == "aarch64" ]]; then
    ARCH="qbittorrent-enhanced-nox_aarch64-linux-musl_static.zip"    
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

# Download files
echo "Downloading binary file: ${ARCH}"
TAG=$(cat /qbittorrent/ReleaseTag)
echo "qbittorrent version: ${TAG}"
curl -L -o ${PWD}/qbittorrent.zip https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-$TAG/$ARCH

echo "Download binary file: ${ARCH} completed"

unzip qbittorrent.zip

# Theme
echo "Downloading theme file"
TAG=$(wget -qO- https://api.github.com/repos/Carve/qbittorrent-webui-cjratliff.com/tags | grep 'name' | cut -d\" -f4 | head -1)
echo "theme tag: ${TAG}"
curl -L -o ${PWD}/theme.zip https://github.com/Carve/qbittorrent-webui-cjratliff.com/archive/refs/tags/$TAG.zip

echo "Download theme file: ${TAG} completed"

unzip theme.zip -d ./tmp
mkdir theme
mv ./tmp/*/* theme