# Include ssh server for eth connectivity
IMAGE_FEATURES_append += "ssh-server-openssh"

# Include stress-ng for additional load generation
IMAGE_INSTALL_append += "stress-ng"

# Additional utilities
IMAGE_INSTALL_append += "\
	screen \
"
