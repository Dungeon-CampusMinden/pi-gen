#!/bin/bash -e

on_chroot << EOF
install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/"
install -m 755 -o 1000 -g 1000 -d "/home/${FIRST_USER_NAME}/Desktop/Workshop/"

runuser -l ${FIRST_USER_NAME} -c 'git -C /home/${FIRST_USER_NAME}/Desktop/Workshop/source pull || git clone --depth 1 https://github.com/Dungeon-CampusMinden/PRODUS.git /home/${FIRST_USER_NAME}/Desktop/Workshop/source'
EOF