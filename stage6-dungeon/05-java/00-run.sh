#!/bin/bash -e

install -m 755 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/levels/"
touch "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/levels/level1.java"
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/levels/level1.java"

latest_tag=$(curl -fsSL "https://api.github.com/repos/Dungeon-CampusMinden/Dungeon/releases" | jq -r '.[] | select(.body | test("Blockly|Dungeon"; "i")) | .tag_name' | head -n1)
curl -L -o "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-desktop.jar" "https://github.com/Dungeon-CampusMinden/Dungeon/releases/download/${latest_tag}/Blockly-desktop.jar"
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-desktop.jar"

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/java-dungeon.desktop" <<- EOF
[Desktop Entry]
Name=Java Dungeon
Type=Application
Icon=/home/${FIRST_USER_NAME}/Desktop/Workshop/source/blockly/frontend/public/cat_logo.png
Exec=sh -c "java -jar /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/Blockly-desktop.jar & code --disable-workspace-trust --user-data-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/data --extensions-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Blockly/extensions /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/levels/ /home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/levels/level1.java"
Path=/home/${FIRST_USER_NAME}/Desktop/Workshop/Blockly/
EOF

chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/java-dungeon.desktop"
chmod 664 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/java-dungeon.desktop"
