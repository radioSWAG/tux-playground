# tux-playground

**A safe place to break Linux and make friends with Tux.**

A home admin lab on Ubuntu Server 26.04 LTS, built step by step in VirtualBox and documented in public. The end goal is a playground anyone can fork: build the server yourself, or start with a ready one and practice breaking and fixing it.

> **Status: work in progress.** I'm building this in the open as I learn. Nothing here is a finished product yet, see the [roadmap](#roadmap) for what exists today.

## Who is this for

- Students and beginners who want to learn Linux administration by doing, not only by reading
- People on **Windows + VirtualBox** (most existing labs assume a Linux host)
- Anyone who wants a safe server to break, so they learn to fix real problems

## Two ways to use it (planned)

| Mode | What it is |
| --- | --- |
| **Build-along** | Follow the phases and build the server yourself, step by step |
| **Playground** | Start with a ready-made server and run break-and-fix scenarios on it |

## What the server will cover

SSH hardening, firewall (UFW) and fail2ban, users and permissions, updates, LVM, systemd services and timers, Bash scripts and backups, Docker, Nginx with TLS, monitoring with Prometheus and Grafana, and finally Ansible to rebuild everything from code.

## Roadmap

| Phase | Topic                                              | Status      |
| ----- | -------------------------------------------------- | ----------- |
| 0     | Preparation: VirtualBox, ISO, repository           | Done        |
| 1     | Install Ubuntu Server 26.04 LTS                    | Done        |
| 2     | First login and base setup (static IP, SSH, tools) | Done        |
| 3     | SSH keys and hardening                             | Done        |
| 4     | Firewall (UFW) and fail2ban                        | Done        |
| 5     | Users,groups and sudo                              | In Progress |
| 6     | Packages and updates                               | Planned     |
| 7     | LVM and file systems                               | Planned     |
| 8     | systemd and journals                               | Planned     |
| 9-10  | Backups, Docker                                    | Planned     |
| 11-12 | Nginx and TLS, monitoring                          | Planned     |
| 13    | Break and fix scenarios                            | Planned     |
| 14    | Ansible: rebuild the whole server from code        | Planned     |

## Repository layout

| Path | What is inside |
| --- | --- |
| `notes.md` | These will be my notes on what I did during each phase |
| `configs/` | Server configs |
| `incidents/` | Various incidents and situations that I have encountered or intentionally created to test certain functions |
| `scripts/` | Any scripts that i create by myself and using on server |
| `scenarios/`, `ansible/`, `compose/`, `docs` | Planned |

## Feedback and contributions

I'm a student learning DevOps and sysadmin skills, so feedback is very welcome: mistakes, unclear steps, ideas for break-and-fix scenarios. Please open an issue.

## License

[MIT](LICENSE)

