#!/bin/bash -e

install -m 664 -o 1000 -g 1000 files/code.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"

on_chroot << EOF
runuser -l ${FIRST_USER_NAME} -c 'DONT_PROMPT_WSL_INSTALL=1 code --install-extension /home/${FIRST_USER_NAME}/Desktop/Workshop/source/doc/produs_unterlagen/blockly-code-runner-1.0.2.vsix'
EOF