# Tux Playground notes

## Phase 0: preparation
- Host: Windows 11 with VirtualBox
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

## Phase 2: network and some configs
- problem: enp0s8 (host-only) had no IPv4, boot waited ~2 minutes for network, dats was too long (you can replace enp0s8 to your own interface name)
- fix: static IP 192.168.56.10/24 on enp0s8 in /etc/netplan/00-installer-config.yaml
- applied with 'netplan try', which rolls back automatically if the connection breaks
- result: ping from Windows works, boot is faster
- config copy saved in configs/netplan/
- enable SSH connection from PowerShell
- update & upgrade system
- set my timezone (sudo timedatectl set-timezone YourTimeZoneNameWithSlash), its very important for logs, TLS-sertificates and other stuff.
- add some useful alias into .bashrc, check it in config/dotfiles/
- installed: vim, btop, tree, wget, git, unzip, bash-completion, nmap, traceroute(note: be careful with vim, its take about 4 minutes for me to escape from it ;3 )

## Phase 3: SSH and Hardening
- created an ed25519 key pair on the Windows host, protected by a passphrase
- mistake: first ran ssh-keygen while loggen in to the server, so the keys landed on the server with a broken file name (PowerShell syntax does not work in Linux). So I'm deleted them and recreated the pair on Windows(not the Server!)
- lesson: the private key must live on the machine you connected FROM, never on the server
- public key added to ~/.ssh/authorized_keys on the server (permissions 700/600)
- hardened sshd with /etc/ssh/sshd_config.d/10-hardening.conf:
  key-only auth, no root login possible, AllowUsers, MaxAuthTries 3
- checked config with sshd -t and sshd -T, tested in a second session before closing the first
  firstly just login like ssh user@192.168.56.10(the server password should not be requested), secondly try ssh -o PubkeyAuthentication=no lab(login with password), and finally ssh root@192.168.56.10 for login as root(in second and third scenario the output in CLI must be "Permission denied")
- config copy saved in configs/ssh/
- сlient side: ~/.ssh/config on Windows with a "Host lab" alias, so I can connect with just "ssh lab"

## Phase 4: Firewall and Fail2ban
- check out my open ports via ports command(alias of sudo ss -tulpn, check out 
- configurated my UFW firewall for allow only devices from my local network to connect by port 22
- created script(already in repo scripts/) for firewall setup
- try to connect from WSL to my server via nmap -Pn 192.168.56.10 command and it show only port 22 opened(success!)
- installed and configurated fail2ban
- important(!): do not configure jail.conf itself, after every udate it will update too, all settings only in .local files
- first Breask & Fix: try to connect from Windows host with password and get banned(i'm in ban) and fix it later
- more info about it in incedents/001-banned-myself.md

## Phase 5: Users and Rights
- create 2 users(dev and intern), group and them into it
- checked what dev can do and what can't

