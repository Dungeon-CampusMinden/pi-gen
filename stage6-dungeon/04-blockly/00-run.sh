#!/bin/bash -e

install -m 755 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"

curl -L -o "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-web.jar" "https://github.com/Dungeon-CampusMinden/Dungeon/releases/latest/download/Blockly-web.jar"
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-web.jar"

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly-dungeon.desktop" <<- EOF
[Desktop Entry]
Name=Blockly Dungeon
Type=Application
Icon=/home/${FIRST_USER_NAME}/Desktop/Workshop/source/blockly/frontend/public/cat_logo.png
Exec=sh -c "java -jar /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-web.jar & xdg-open http://localhost:8081"
Path=/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/
EOF
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly-dungeon.desktop"
chmod 664 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly-dungeon.desktop"
