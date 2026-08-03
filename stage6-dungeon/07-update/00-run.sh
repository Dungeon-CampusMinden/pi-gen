#!/bin/bash -e

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh" <<- EOF
#!/usr/bin/env bash

# Update git repository and stash changes to avoid merge conflicts
git -C /home/${FIRST_USER_NAME}/Desktop/Workshop/source stash
git -C /home/${FIRST_USER_NAME}/Desktop/Workshop/source pull

# Update Blockly jars
latest_tag=$(curl -fsSL "https://api.github.com/repos/Dungeon-CampusMinden/Dungeon/releases" | jq -r '.[] | select(.body | test("Blockly|Dungeon"; "i")) | .tag_name' | head -n1)
curl -L -o "/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-web.jar" "https://github.com/Dungeon-CampusMinden/PRODUS/releases/download/${latest_tag}/Blockly-web.jar"
curl -L -o "/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-desktop.jar" "https://github.com/Dungeon-CampusMinden/PRODUS/releases/download/${latest_tag}/Blockly-desktop.jar"
EOF

chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh"
chmod 755 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/update.sh"