#!/bin/bash -e

cat > "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/advanced-dungeon.desktop" <<- EOF
[Desktop Entry]
Name=Advanced Dungeon
Type=Application
Icon=vscode
Exec=code --disable-workspace-trust --user-data-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/data --extensions-dir /home/${FIRST_USER_NAME}/Desktop/Workshop/.code/Java/extensions /home/${FIRST_USER_NAME}/Desktop/Workshop/source
EOF
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/advanced-dungeon.desktop"
chmod 664 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/advanced-dungeon.desktop"

on_chroot << EOF
# Have to kill java processes to make sure that the gradle daemon is not running, otherwise can not unmount filesystems
runuser -l ${FIRST_USER_NAME} -c '(cd ~/Desktop/Workshop/source && ./gradlew --no-daemon --console=plain assemble) && killall java'
EOF
