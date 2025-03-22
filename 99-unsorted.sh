

# Sat Mar 22 06:52:14 PM EDT 2025 - New / changed files


CopyFile /boot/grub/grub.cfg 600
CopyFile /boot/grub/grubenv
CopyFile /efi/EFI/GRUB/grubx64.efi 755
CreateFile /etc/.pwd.lock 600 > /dev/null
CopyFile /etc/adjtime
CreateDir /etc/cni/net.d 700
CreateDir /etc/colord '' colord colord
CreateLink /etc/fonts/conf.d/10-hinting-slight.conf /usr/share/fontconfig/conf.default/10-hinting-slight.conf
CreateLink /etc/fonts/conf.d/10-scale-bitmap-fonts.conf /usr/share/fontconfig/conf.default/10-scale-bitmap-fonts.conf
CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf /usr/share/fontconfig/conf.default/10-sub-pixel-rgb.conf
CreateLink /etc/fonts/conf.d/10-yes-antialias.conf /usr/share/fontconfig/conf.default/10-yes-antialias.conf
CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf /usr/share/fontconfig/conf.default/11-lcdfilter-default.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-vera.conf /usr/share/fontconfig/conf.default/20-unhint-small-vera.conf
CreateLink /etc/fonts/conf.d/30-metric-aliases.conf /usr/share/fontconfig/conf.default/30-metric-aliases.conf
CreateLink /etc/fonts/conf.d/40-nonlatin.conf /usr/share/fontconfig/conf.default/40-nonlatin.conf
CreateLink /etc/fonts/conf.d/45-generic.conf /usr/share/fontconfig/conf.default/45-generic.conf
CreateLink /etc/fonts/conf.d/45-latin.conf /usr/share/fontconfig/conf.default/45-latin.conf
CreateLink /etc/fonts/conf.d/48-spacing.conf /usr/share/fontconfig/conf.default/48-spacing.conf
CreateLink /etc/fonts/conf.d/49-sansserif.conf /usr/share/fontconfig/conf.default/49-sansserif.conf
CreateLink /etc/fonts/conf.d/50-user.conf /usr/share/fontconfig/conf.default/50-user.conf
CreateLink /etc/fonts/conf.d/51-local.conf /usr/share/fontconfig/conf.default/51-local.conf
CreateLink /etc/fonts/conf.d/60-generic.conf /usr/share/fontconfig/conf.default/60-generic.conf
CreateLink /etc/fonts/conf.d/60-latin.conf /usr/share/fontconfig/conf.default/60-latin.conf
CreateLink /etc/fonts/conf.d/65-fonts-persian.conf /usr/share/fontconfig/conf.default/65-fonts-persian.conf
CreateLink /etc/fonts/conf.d/65-nonlatin.conf /usr/share/fontconfig/conf.default/65-nonlatin.conf
CreateLink /etc/fonts/conf.d/69-unifont.conf /usr/share/fontconfig/conf.default/69-unifont.conf
CreateLink /etc/fonts/conf.d/69-urw-bookman.conf /usr/share/fontconfig/conf.default/69-urw-bookman.conf
CreateLink /etc/fonts/conf.d/69-urw-c059.conf /usr/share/fontconfig/conf.default/69-urw-c059.conf
CreateLink /etc/fonts/conf.d/69-urw-d050000l.conf /usr/share/fontconfig/conf.default/69-urw-d050000l.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-backwards.conf /usr/share/fontconfig/conf.default/69-urw-fallback-backwards.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-generics.conf /usr/share/fontconfig/conf.default/69-urw-fallback-generics.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-specifics.conf /usr/share/fontconfig/conf.default/69-urw-fallback-specifics.conf
CreateLink /etc/fonts/conf.d/69-urw-gothic.conf /usr/share/fontconfig/conf.default/69-urw-gothic.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-mono-ps.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-mono-ps.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-roman.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-roman.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-sans.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-sans.conf
CreateLink /etc/fonts/conf.d/69-urw-p052.conf /usr/share/fontconfig/conf.default/69-urw-p052.conf
CreateLink /etc/fonts/conf.d/69-urw-standard-symbols-ps.conf /usr/share/fontconfig/conf.default/69-urw-standard-symbols-ps.conf
CreateLink /etc/fonts/conf.d/69-urw-z003.conf /usr/share/fontconfig/conf.default/69-urw-z003.conf
CreateLink /etc/fonts/conf.d/80-delicious.conf /usr/share/fontconfig/conf.default/80-delicious.conf
CreateLink /etc/fonts/conf.d/90-synthetic.conf /usr/share/fontconfig/conf.default/90-synthetic.conf
CopyFile /etc/fstab
CopyFile /etc/group
CopyFile /etc/group-
CopyFile /etc/hostname
CopyFile /etc/ld.so.cache
CopyFile /etc/lightdm/lightdm.conf
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/America/New_York
CopyFile /etc/machine-id 444
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/nix/nix.conf
CreateLink /etc/os-release ../usr/lib/os-release
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/passwd
CopyFile /etc/passwd-
CopyFile /etc/resolv.conf
CopyFile /etc/shells
CopyFile /etc/ssh/sshd_config
CopyFile /etc/subgid
CreateFile /etc/subgid- > /dev/null
CopyFile /etc/subuid
CreateFile /etc/subuid- > /dev/null
CopyFile /etc/sudoers
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CopyFile /etc/vconsole.conf
CreateDir /opt/containerd/bin 711
CreateDir /opt/containerd/lib 711
CopyFile /usr/lib32/gconv/gconv-modules.cache
CopyFile /usr/share/applications/mimeinfo.cache
CopyFile /usr/share/glib-2.0/schemas/gschemas.compiled
CopyFile /usr/share/icons/Adwaita/icon-theme.cache
CopyFile /usr/share/icons/AdwaitaLegacy/icon-theme.cache
CopyFile /usr/share/icons/hicolor/icon-theme.cache
CopyFile /usr/share/info/dir
CreateFile /var/db/sudo/lectured/1000 600 '' jonathan > /dev/null
CopyFile /var/lib/AccountsService/users/jonathan 600
CreateDir /var/lib/colord/.cache 700 colord colord
CreateDir /var/lib/colord/icc '' colord colord
CopyFile /var/lib/colord/mapping.db '' colord colord
CopyFile /var/lib/colord/storage.db '' colord colord
CreateLink /var/lib/dbus/machine-id /etc/machine-id
CreateDir /var/lib/lastlog
CreateDir /var/lib/libuuid 2775 uuidd uuidd
CreateDir /var/lib/lightdm-data/jonathan 770 jonathan lightdm
CreateDir /var/lib/lightdm-data/lightdm 770 lightdm lightdm
CopyFile /var/lib/lightdm/.cache/lightdm-gtk-greeter/state '' lightdm lightdm
CreateDir /var/lib/machines 700
CreateDir /var/lib/portables 700
CreateDir /var/lib/private 700
CopyFile /var/lib/system-manager/state/system-manager-state.json
CopyFile /var/lib/systemd/catalog/database
CreateDir /var/lib/systemd/ephemeral-trees
CreateDir /var/lib/systemd/linger
CreateDir /var/lib/systemd/network '' systemd-network systemd-network
CreateDir /var/lib/systemd/pstore
CopyFile /var/lib/systemd/rfkill/pci-0000:02:00.0-usb-0:10:1.0:bluetooth
CreateFile /var/lib/systemd/timers/stamp-archlinux-keyring-wkd-sync.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-man-db.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-shadow.timer > /dev/null
CopyFile /var/lib/tailscale/derpmap.cached.json 600
CreateDir /var/lib/tailscale/files/archtower.tail9aafa.ts.net-uid-3955332204317087 700
CreateDir /var/lib/tailscale/files/zmrvdttxnr-privaterelay.appleid.com-uid-5743511485788319 700
CopyFile /var/lib/tailscale/tailscaled.state 600
CreateDir /var/lib/tpm2-tss/system/keystore 2775 tss tss
CopyFile /var/spool/cron/root 600


# Sat Mar 22 06:52:14 PM EDT 2025 - New file properties


SetFileProperty /opt/containerd mode 711
SetFileProperty /opt group root
SetFileProperty /opt owner root
SetFileProperty /usr/bin/groupmems group groups
SetFileProperty /usr/bin/groupmems mode 2750
SetFileProperty /usr/share/applications group root
SetFileProperty /usr/share/applications owner root
SetFileProperty /usr/share/icons/hicolor/128x128/apps group root
SetFileProperty /usr/share/icons/hicolor/128x128/apps owner root
SetFileProperty /usr/share/icons/hicolor/128x128 group root
SetFileProperty /usr/share/icons/hicolor/128x128 owner root
SetFileProperty /usr/share/icons/hicolor/16x16/apps group root
SetFileProperty /usr/share/icons/hicolor/16x16/apps owner root
SetFileProperty /usr/share/icons/hicolor/16x16 group root
SetFileProperty /usr/share/icons/hicolor/16x16 owner root
SetFileProperty /usr/share/icons/hicolor/256x256/apps group root
SetFileProperty /usr/share/icons/hicolor/256x256/apps owner root
SetFileProperty /usr/share/icons/hicolor/256x256 group root
SetFileProperty /usr/share/icons/hicolor/256x256 owner root
SetFileProperty /usr/share/icons/hicolor/32x32/apps group root
SetFileProperty /usr/share/icons/hicolor/32x32/apps owner root
SetFileProperty /usr/share/icons/hicolor/32x32 group root
SetFileProperty /usr/share/icons/hicolor/32x32 owner root
SetFileProperty /usr/share/icons/hicolor/512x512/apps group root
SetFileProperty /usr/share/icons/hicolor/512x512/apps owner root
SetFileProperty /usr/share/icons/hicolor/512x512 group root
SetFileProperty /usr/share/icons/hicolor/512x512 owner root
SetFileProperty /usr/share/icons/hicolor/64x64/apps group root
SetFileProperty /usr/share/icons/hicolor/64x64/apps owner root
SetFileProperty /usr/share/icons/hicolor/64x64 group root
SetFileProperty /usr/share/icons/hicolor/64x64 owner root
SetFileProperty /usr/share/icons/hicolor group root
SetFileProperty /usr/share/icons/hicolor owner root
SetFileProperty /usr/share/icons group root
SetFileProperty /usr/share/icons owner root
SetFileProperty /usr/share group root
SetFileProperty /usr/share owner root
SetFileProperty /usr group root
SetFileProperty /usr owner root
SetFileProperty /var/lib/colord group colord
SetFileProperty /var/lib/colord owner colord
SetFileProperty /var/lib/lightdm-data group lightdm
SetFileProperty /var/lib/lightdm-data mode 1770
SetFileProperty /var/lib/lightdm-data owner lightdm
SetFileProperty /var/lib/lightdm/.cache/lightdm-gtk-greeter group lightdm
SetFileProperty /var/lib/lightdm/.cache/lightdm-gtk-greeter owner lightdm
SetFileProperty /var/lib/lightdm/.cache group lightdm
SetFileProperty /var/lib/lightdm/.cache owner lightdm
SetFileProperty /var/lib/lightdm group lightdm
SetFileProperty /var/lib/lightdm mode 1770
SetFileProperty /var/lib/lightdm owner lightdm
SetFileProperty /var/lib/tailscale/files mode 700
SetFileProperty /var/lib/tailscale mode 700
