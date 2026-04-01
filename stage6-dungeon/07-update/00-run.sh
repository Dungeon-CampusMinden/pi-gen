#!/bin/bash -e

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh" <<- EOF
#!/usr/bin/env bash

# Update git repository and stash changes to avoid merge conflicts
git -C /home/${FIRST_USER_NAME}/Desktop/Workshop/source stash
git -C /home/${FIRST_USER_NAME}/Desktop/Workshop/source pull

# Update Blockly jars
curl -L -o "/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-web.jar" "https://github.com/Dungeon-CampusMinden/Dungeon/releases/latest/download/Blockly-web.jar"
curl -L -o "/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-desktop.jar" "https://github.com/Dungeon-CampusMinden/Dungeon/releases/latest/download/Blockly-desktop.jar"
EOF

chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh"
chmod 755 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh"