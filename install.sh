#!/bin/bash
if [[ $(which java) ]]; then
    echo "Java is already installed"
else
    echo "Downloading Java..."
    sudo apt-get install default-jre
fi
if [[ $(which wget) ]]; then
    echo "wget is alerady installed"
    echo " "
else
    echo "Downloading wget..."
    sudo apt-get install wget
fi
wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar # Downloads the server software from mojang
java -Xmx2G -Xms1024M -jar server.jar >/dev/null 2>&1 # Runs the server once to get additional files
sed -i -e 's/false/true/g' eula.txt # replaces "false" with "true" in the eula
touch server.sh # creates bash script file
echo "java -Xmx2G -Xms2G -jar server.jar nogui" >> server.sh # fills the bash script with the command 
chmod +x server.sh # makes the bash script executable
