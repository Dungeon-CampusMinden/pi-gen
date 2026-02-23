#!/bin/bash -e

install -m 755 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"
install -m 755 -o 1000 -g 1000 files/Blockly_server.bin "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"

install -m 755 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/content/"
install -m 644 -o 1000 -g 1000 files/blockly.jar "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/content/"
install -m 644 -o 1000 -g 1000 files/index.html "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/content/"

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly.desktop" <<- EOF
[Desktop Entry]
Name=Blockly Dungeon
Type=Application
Icon=/home/${FIRST_USER_NAME}/Desktop/Workshop/source/blockly/frontend/public/cat_logo.png
Exec=/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly_server.bin
Path=/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/
EOF
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly.desktop"
chmod 664 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/blockly.desktop"

on_chroot << EOF
cp /home/${FIRST_USER_NAME}/Desktop/Workshop/source/blockly/frontend/public/* /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/content/
EOF