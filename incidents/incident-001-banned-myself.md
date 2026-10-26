# INC-001: banned myself with fail2ban

Date: 2026-10-26
Phase: 4 (fail2ban)

## Symptom
- New SSH connections failed with "Connection refused" on port 22
- My already open SSH session was cut: "client_loop: send disconnect: Connection reset"
- Ping to the server still worked normally

## Cause
I ran several failed logins (fake user) from the Windows host to test fail2ban.
After 5 failures in 10 minutes fail2ban banned my IP 192.168.56.1.
It bans the IP, not a session, so my working session from the same IP was cut too.

## How I found it
1. ping worked, so the network was fine
2. Test-NetConnection to port 22 pointed at something blocking the port
3. sudo fail2ban-client status sshd showed 192.168.56.1 in "Banned IP list"
4. /var/log/fail2ban.log: "Ban 192.168.56.1" at 15:29:51

## Fix
From the VirtualBox console:
sudo fail2ban-client set sshd unbanip 192.168.56.1

## How to avoid it
- Do not test failed logins from the same machine I manage the server from
- Keep the VirtualBox console as a way in that does not depend on SSH

## Decision: ignoreip
I did NOT add 192.168.56.0/24 to ignoreip. ignoreip stays 127.0.0.1/8 ::1

Why:
- I didn’t add the entire subnet to the whitelist, because the fewer exceptions there are, the more honest the check is
- The ban is easy to undo from the VirtualBox console (fail2ban-client set sshd unbanip)
- Getting banned once showed me how the protection works, which was the point of the exercise

Result:
- I keep ignoreip minimal. My real protection is key-only aut and fail2ban is a second layer(at the time of phase 4)
