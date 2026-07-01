#!/bin/bash -e

install -m 664 -o 1000 -g 1000 files/code.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"

on_chroot << EOF

install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/data/"
install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/extensions/"

runuser -l ${FIRST_USER_NAME} -c 'DONT_PROMPT_WSL_INSTALL=1 code \
  --user-data-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/data \
  --extensions-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/extensions \
  --install-extension /home/${FIRST_USER_NAME}/Desktop/Workshop/source/doc/produs_unterlagen/blockly-code-runner-*.vsix'

install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/data/"
install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/extensions/"

runuser -l ${FIRST_USER_NAME} -c 'DONT_PROMPT_WSL_INSTALL=1 code \
  --user-data-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/data \
  --extensions-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/extensions \
  --install-extension vscjava.vscode-gradle \
  --install-extension redhat.java'
EOF
