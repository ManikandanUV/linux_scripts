#!/bin/bash

TIMESTAMP=$(date +%Y_%m_%d_%H_%M_%S)

btrfs subvolume snapshot / /btrfs_root/@snapshots/$TIMESTAMP
grub-mkconfig -o /boot/grub/grub.cfg
