#!/bin/bash -e

if [ -v WPA_ESSID ] && [ -v WPA_PASSWORD ]; then
	install -m 600 files/default-wifi.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
	sed -i "s/PLACEHOLDER_SSID/${WPA_ESSID}/" "${ROOTFS_DIR}/etc/NetworkManager/system-connections/default-wifi.nmconnection"
	sed -i "s/PLACEHOLDER_PASSWORD/${WPA_PASSWORD}/" "${ROOTFS_DIR}/etc/NetworkManager/system-connections/default-wifi.nmconnection"
fi