# Connectivity info for Linux VM
NIXADDR ?= 192.168.106.128
NIXPORT ?= 22
NIXUSER ?= bauerdic
NIXSYSTEM ?= mac

# Settings
NIXBLOCKDEVICE ?= sda

# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

# The name of the nixosConfiguration in the flake
NIXMAC ?= homeManagerConfigurationsMac.bauerdic.activationPackage
NIXLIMA ?= homeManagerConfigurationsLima.bauerdic.activationPackage

update:
	nix flake update

macbuild:
	nix build ".#${NIXMAC}"

limabuild:
	nix build ".#${NIXLIMA}"

activate:
	./result/activate

# SSH options that are used. These aren't meant to be overridden but are
# reused a lot so we just store them up here.
SSH_OPTIONS=-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

