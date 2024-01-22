Archlinux System Maintenance
============================

`
systemctl --failed
journalctl -b
pacman -Syu
find /etc -type f -name \*.pacnew
`

## Orphaned packages

`
pacman -Qtd
pacman -D --asexplicit <package_name>
`

vim /var/log/pacman.log


curl --data-binary @file.txt https://paste.rs/

