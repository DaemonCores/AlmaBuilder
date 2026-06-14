# personal-server net-install kickstart
# Anaconda pulls the bootc image from GHCR at install time.

network --hostname=AlmaBuilder

# Pull the bootc image from the registry
ostreecontainer --url=ghcr.io/DaemonCores/AlmaBuilder:latest --no-signature-verification

# Reboot after install
reboot
