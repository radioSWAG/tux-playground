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

## Phase 2(not full): network and some configs
- problem: enp0s8 (host-only) had no IPv4, boot waited ~2 minutes for network, dats was too long
- fix: static IP 192.168.56.10/24 on enp0s8 in /etc/netplan/00-installer-config.yaml
- applied with netplan try, which rolls back automatically if the connection breaks
- result: ping from Windows works, boot is faster
- config copy saved in confis/netplan/
- enable SSH connection from PowerShell
- update & upgrade system
- set my timezone (sudo timedatectl set-timezone YourTimeZoneNameWithSlash), its very important for logs, TLS-sertificates and other stuff.
- lil modify for .bashrc(not ready for push)
- installed: vim, btop, tree, wget, git, unzip, bash-completion, nmap, traceroute(note: be careful with vim, its take about 4 minutes for me to escape from it ;3 )

