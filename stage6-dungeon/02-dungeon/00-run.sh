#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/"
chown -R 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/"

mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"
chown -R 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"
install -m 644 -o 1000 -g 1000 files/Blockly.jar "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"
install -m 644 -o 1000 -g 1000 files/Blockly_server.bin "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"
install -m 644 -o 1000 -g 1000 files/blockly-code-runner.vsix "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/"

on_chroot << EOF
runuser -l ${FIRST_USER_NAME} -c 'DONT_PROMPT_WSL_INSTALL=1 code --install-extension /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/blockly-code-runner.vsix'
EOF