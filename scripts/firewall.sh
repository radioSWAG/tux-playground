#!/usr/bin/env bash
#Basic UFW rules for tux-playground

set -euo pipefail
HOST_NET="192.168.56.0/24"
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow from "$HOST_NET" to any port 22 proto tcp comment 'SSH from host-only'
ufw logging on
ufw --force enable
ufw status verbose
