

# Sat Mar 22 04:11:42 PM EDT 2025 - Unknown packages


AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage cinnamon # Linux desktop which provides advanced innovative features and a traditional user experience
AddPackage cronie # Daemon that runs specified programs at scheduled times and related tools
AddPackage dhcpcd # DHCP/ IPv4LL/ IPv6RA/ DHCPv6 client
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
AddPackage firefox # Fast, Private & Safe Web Browser
AddPackage gimp # GNU Image Manipulation Program
AddPackage git # the fast distributed version control system
AddPackage gnu-free-fonts # A free family of scalable outline fonts
AddPackage grub # GNU GRand Unified Bootloader (2)
AddPackage htop # Interactive process viewer
AddPackage lightdm # A lightweight display manager
AddPackage lightdm-gtk-greeter # GTK+ greeter for LightDM
AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux
AddPackage man-db # A utility for reading man pages
AddPackage mate-terminal # The MATE Terminal Emulator
AddPackage nano # Pico editor clone with enhancements
AddPackage nix # A purely functional package manager
AddPackage nvidia-open # NVIDIA open kernel modules
AddPackage openssh # SSH protocol implementation for remote login, command execution and file transfer
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage tailscale # A mesh VPN that makes it easy to connect your devices, wherever they are.
AddPackage tigervnc # Suite of VNC servers and clients based on the VNC 4 branch of TightVNC
AddPackage tmux # Terminal multiplexer
AddPackage vi # The original ex/vi text editor
AddPackage warp-terminal # Warp, the Rust-based terminal for developers and teams
AddPackage xorg-server # Xorg X server
AddPackage xorg-xauth # X.Org authorization settings program


# Sat Mar 22 04:11:44 PM EDT 2025 - Unknown foreign packages


AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign paru # Feature packed AUR helper
AddPackage --foreign paru-debug # Detached debugging symbols for paru
AddPackage --foreign proton-pass-bin # Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions.


# Sat Mar 22 04:11:44 PM EDT 2025 - New / changed files


CopyFile /boot/grub/grub.cfg 600
CopyFile /boot/grub/grubenv
CopyFile /efi/EFI/GRUB/grubx64.efi 755
CreateFile /etc/.pwd.lock 600 > /dev/null
CopyFile /etc/.updated
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
CopyFile /etc/resolv.pre-tailscale-backup.conf
CopyFile /etc/shells
CopyFile /etc/ssh/ssh_host_ecdsa_key 600
CopyFile /etc/ssh/ssh_host_ecdsa_key.pub
CopyFile /etc/ssh/ssh_host_ed25519_key 600
CopyFile /etc/ssh/ssh_host_ed25519_key.pub
CopyFile /etc/ssh/ssh_host_rsa_key 600
CopyFile /etc/ssh/ssh_host_rsa_key.pub
CopyFile /etc/ssh/sshd_config
CopyFile /etc/subgid
CreateFile /etc/subgid- > /dev/null
CopyFile /etc/subuid
CreateFile /etc/subuid- > /dev/null
CopyFile /etc/sudoers
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/lightdm.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/dhcpcd.service /usr/lib/systemd/system/dhcpcd.service
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
CreateLink /etc/systemd/system/multi-user.target.wants/nix-daemon.service /usr/lib/systemd/system/nix-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CreateLink /etc/systemd/system/multi-user.target.wants/tailscaled.service /usr/lib/systemd/system/tailscaled.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/system/systemd-hibernate.service.wants/nvidia-hibernate.service /usr/lib/systemd/system/nvidia-hibernate.service
CreateLink /etc/systemd/system/systemd-hibernate.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend-then-hibernate.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend.service.wants/nvidia-suspend.service /usr/lib/systemd/system/nvidia-suspend.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CopyFile /etc/vconsole.conf
CreateDir /opt/containerd/bin 711
CreateDir /opt/containerd/lib 711
CopyFile /opt/vulscanagent-data/cronjobs/deadbeefdead_cronjob.sh 755
CopyFile /opt/vulscanagent-data/scripts/vulscan_easy_install.sh 755
CopyFile /opt/vulscanagent-data/scripts/vulscan_easy_install_uninstall.sh 755
CopyFile /opt/vulscanagent-data/scripts/vulscan_easy_install_updater.sh 755
CreateDir /storage
CopyFile /usr/share/applications/mimeinfo.cache
CopyFile /usr/share/glib-2.0/schemas/gschemas.compiled
CopyFile /usr/share/icons/Adwaita/icon-theme.cache
CopyFile /usr/share/icons/AdwaitaLegacy/icon-theme.cache
CopyFile /usr/share/icons/hicolor/icon-theme.cache
CopyFile /usr/share/info/dir
CopyFile /var/.updated
CreateFile /var/db/sudo/lectured/1000 600 '' jonathan > /dev/null
CopyFile /var/lib/AccountsService/users/jonathan
CreateDir /var/lib/colord/.cache 700 colord colord
CreateDir /var/lib/colord/icc '' colord colord
CopyFile /var/lib/colord/mapping.db '' colord colord
CopyFile /var/lib/colord/storage.db '' colord colord
CopyFile /var/lib/containerd/io.containerd.content.v1.content/blobs/sha256/ca803dc10b830a8b65ce03b7e952d2caa2888c1de7d3ae9826c6ccbce1c146dc 444
CreateDir /var/lib/containerd/io.containerd.content.v1.content/ingest
CopyFile /var/lib/containerd/io.containerd.metadata.v1.bolt/meta.db
CreateDir /var/lib/containerd/io.containerd.runtime.v2.task/moby/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501 711
CreateDir /var/lib/containerd/io.containerd.sandbox.controller.v1.shim 711
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.blockfile 700
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.btrfs/active
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.btrfs/snapshots
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.btrfs/view
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.native/snapshots 700
CreateDir /var/lib/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots 700
CreateDir /var/lib/containerd/tmpmounts 700
CreateLink /var/lib/dbus/machine-id /etc/machine-id
CopyFile /var/lib/dhcpcd/duid 640
CopyFile /var/lib/dhcpcd/enp5s0.lease 640
CopyFile /var/lib/dhcpcd/secret 400
CopyFile /var/lib/docker/buildkit/cache.db 600
CopyFile /var/lib/docker/buildkit/containerdmeta.db
CreateDir /var/lib/docker/buildkit/executor 711
CopyFile /var/lib/docker/buildkit/history.db 600
CopyFile /var/lib/docker/buildkit/metadata_v2.db 600
CopyFile /var/lib/docker/buildkit/snapshots.db 600
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501-json.log 640
CreateDir /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/checkpoints 700
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/config.v2.json 600
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/hostconfig.json 600
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/hostname
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/hosts
CreateDir /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/mounts 710
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/resolv.conf
CopyFile /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501/resolv.conf.hash
CopyFile /var/lib/docker/engine-id 600
CopyFile /var/lib/docker/network/files/local-kv.db
CreateDir /var/lib/docker/plugins/tmp 700
CreateDir /var/lib/docker/runtimes 700
CreateDir /var/lib/docker/swarm 700
CreateDir /var/lib/docker/tmp 700
CreateDir /var/lib/lastlog
CreateDir /var/lib/libuuid 2775 uuidd uuidd
CreateDir /var/lib/lightdm-data/jonathan 770 jonathan lightdm
CreateDir /var/lib/lightdm-data/lightdm 770 lightdm lightdm
CopyFile /var/lib/lightdm/.Xauthority 600 lightdm lightdm
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
CopyFile /var/lib/systemd/random-seed 600
CopyFile /var/lib/systemd/rfkill/pci-0000:02:00.0-usb-0:10:1.0:bluetooth
CreateFile /var/lib/systemd/timers/stamp-archlinux-keyring-wkd-sync.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-man-db.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-shadow.timer > /dev/null
CopyFile /var/lib/tailscale/derpmap.cached.json 600
CreateDir /var/lib/tailscale/files/archtower.tail9aafa.ts.net-uid-3955332204317087 700
CreateDir /var/lib/tailscale/files/zmrvdttxnr-privaterelay.appleid.com-uid-5743511485788319 700
CopyFile /var/lib/tailscale/tailscaled.state 600
CreateDir /var/lib/tpm2-tss/system/keystore 2775 tss tss
CopyFile /var/lib/upower/history-charge-TrippLite-TRIPP_LITE_UPS_-FW-2473_A_.dat
CopyFile /var/lib/upower/history-rate-TrippLite-TRIPP_LITE_UPS_-FW-2473_A_.dat
CopyFile /var/lib/upower/history-time-empty-TrippLite-TRIPP_LITE_UPS_-FW-2473_A_.dat
CopyFile /var/lib/upower/history-time-full-TrippLite-TRIPP_LITE_UPS_-FW-2473_A_.dat
CopyFile /var/spool/cron/root 600


# Sat Mar 22 04:11:45 PM EDT 2025 - New file properties


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
SetFileProperty /var/lib/containerd/io.containerd.metadata.v1.bolt mode 711
SetFileProperty /var/lib/containerd/io.containerd.runtime.v2.task/moby mode 711
SetFileProperty /var/lib/containerd/io.containerd.runtime.v2.task mode 711
SetFileProperty /var/lib/containerd/io.containerd.snapshotter.v1.btrfs mode 700
SetFileProperty /var/lib/containerd/io.containerd.snapshotter.v1.native mode 700
SetFileProperty /var/lib/containerd/io.containerd.snapshotter.v1.overlayfs mode 700
SetFileProperty /var/lib/containerd mode 711
SetFileProperty /var/lib/docker/buildkit mode 711
SetFileProperty /var/lib/docker/containers/b3d370ca244aa0dcfe72e63af6bed26ae7c908f3bb171a7e11602f94c2dc1501 mode 710
SetFileProperty /var/lib/docker/containers mode 710
SetFileProperty /var/lib/docker/network/files mode 750
SetFileProperty /var/lib/docker/network mode 750
SetFileProperty /var/lib/docker/plugins mode 700
SetFileProperty /var/lib/docker mode 710
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
