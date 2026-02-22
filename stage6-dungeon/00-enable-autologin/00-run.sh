#!/bin/bash -e

if [ "${ENABLE_AUTO_LOGIN}" -eq 1 ]; then
	echo "Enabling autologin for user ${FIRST_USER_NAME}"
	on_chroot <<- EOF
		SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_behaviour B4
	EOF
else
	echo "Autologin is disabled, skipping configuration"
	exit 0
fi