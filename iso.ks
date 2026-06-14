# personal-server net-install kickstart
# Anaconda pulls the bootc image from GHCR at install time.

network --hostname=£{repository.name}

# Pull the bootc image from the registry
ostreecontainer --url=ghcr.io/£{repository}:latest --no-signature-verification

# Reboot after install
reboot
