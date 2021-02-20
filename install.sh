#!/bin/bash
if [[ $(which java) ]]; then
    echo "Java is already installed"
else
    printf "Downloading Java..."
    printf "$(sudo apt-get install default-jre)"
fi
if [[ $(which wget) ]]; then
    echo "wget is alerady installed"
else
    printf "Downloading wget..."
    printf "$(sudo apt-get install wget)"
fi
printf "$(wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar)"
printf "$(java -Xmx2G -Xms1024M -jar server.jar >/dev/null 2>&1 && touch server.sh && echo java -Xmx2G -Xms1024M -jar server.jar nogui >> server.sh && chmod +x server.sh)"
