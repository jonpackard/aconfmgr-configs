CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateFile /var/lib/systemd/timesync/clock '' systemd-timesync systemd-timesync > /dev/null
SetFileProperty /var/lib/systemd/timesync group systemd-timesync
SetFileProperty /var/lib/systemd/timesync owner systemd-timesync
