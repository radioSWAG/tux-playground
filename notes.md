# Tux Playground notes

## Phase 0: preparation
- Host: Windows with VirtualBox
- ISO: Ubuntu Server 26.04 LTS, SHA256 checked
- Repo: tux-playground on GitHub, MIT license

## Phase 1: install Ubuntu Server in VirtualBox
- VM: 4096 MB RAM, 2 CPUs, 40 GB disk
- Network: adapter 1 NAT, adapter 2 Host-only (192.168.56.0/24)
- Installer: LVM without encryption, about 19 GB left free for later
- SSH: OpenSSH server installed, password login still on, no keys yet
- No featured snaps
- After install: ISO ejected, first login works, snapshot phase-01-clean-install
- Note: enp0s8 has no IPv4 yet, so boot waits about 2 minutes. Fix in phase 2
