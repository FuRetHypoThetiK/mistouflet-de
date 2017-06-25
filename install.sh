touch /etc/testfile || (echo "Please run this script as root" && exit 1)
rm /etc/testfile

apt update || (echo "Could not reach ubuntu repositories. Check your Internet connection" && exit 1)
apt upgrade -y && apt dist-upgrade -y

apt install lightdm openbox-gnome-session openbox terminator -y || (echo "Could not install necessary packages. Aborting." && exit 1)

apt install obconf obmenu tint2 nitrogen unzip firefox gedit gparted irssi ssh alsa-utils pulseaudio volti -y && echo "Installation of basic packages finished."

cd ~
echo "Downloading Mistouflet DE config files ..."
wget -N furet-pi.ddns.net/FuRet-Repository/mistouflet-de/m.de.config.zip || echo "Could not reach Mistouflet DE server to get config files. Wallpaper, taskbar and other parts of Mistouflet DE theme won't be installed. Instead, you'll have the default theme of Openbox, Tint2 and Nitrogen."
cd /
wget -N furet-pi.ddns.net/FuRet-Repository/mistouflet-de/m.de.wallpaper.png || echo "Could not reach Mistouflet DE server to get default wallpaper."
cd ~
echo "Extracting Mistouflet DE config files ..."
unzip -o  m.de.config.zip
chmod -R 777 ~/.config/

printf "\n\n\nINSTALLATION FINISHED\nEnjoy your Mistouflet DE!\n\nNext boot, choose \'Openbox\' as session manager (not \'GNOME Openbox\')\n\n"
