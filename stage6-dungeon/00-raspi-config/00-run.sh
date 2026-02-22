#!/bin/bash -e

# Enable autologin
if [ -v ENABLE_AUTO_LOGIN ] && [ "${ENABLE_AUTO_LOGIN}" -eq 1 ]; then
	echo "Enabling autologin for user ${FIRST_USER_NAME}"
	on_chroot <<- EOF
		SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_behaviour B4
	EOF
fi

# Set Firefox as default browser
on_chroot << EOF
SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_browser firefox
EOF