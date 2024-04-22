#!/bin/bash

#FOR_KDE_F38+
#configuration dnf
echo -e "\tconfiguration dnf" && sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in -y dnf-automatic && systemctl enable dnf-automatic.timer
#rpmfusion
echo -e "\trpmfusion" && sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#rm_stok_apps
echo -e "\trm stock apps" && sudo dnf rm -y mediawriter rhythmbox evince yelp totem firefox libreoffice* power-profiles-daemon kolourpaint kmahjongg kmines akregator kmail* konversation ktnef pimdataexporter sieveeditor dragon elisa kamoso kaddressbook kontact korganizer kpat
#codecs
echo -e "\tcodecs" && sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf in -y lame\* --exclude=lame-devel && sudo dnf group upgrade -y Multimedia --with-optional --allowerasing
echo -e "\tKernel Fsync" && sudo dnf copr enable -y sentry/kernel-fsync
echo -e "\tNoiseTorch" && sudo dnf copr enable -y principis/NoiseTorch && sudo dnf in -y noisetorch
echo -e "\tDiscord" && sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo && sudo dnf in -y discord
#Install_Apps
sudo dnf config-manager --set-enabled google-chrome
echo -e "\tInstall Apps" && sudo dnf in -y mangohud timeshift goverlay steam lutris transmission kdenlive vlc htop redhat-lsb-core rocm-opencl inxi neofetch protontricks openssl easyeffects corectrl gimp google-chrome-stable openrgb piper --allowerasing
sudo dnf update -y --refresh
#Flatpak
echo -e "\tFlatpak" && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak install flathub -y com.heroicgameslauncher.hgl com.obsproject.Studio net.davidotek.pupgui2 ru.yandex.Browser
#Disable_Services
echo -e "\tOFF_Services"
sudo systemctl mask plymouth-quit-wait.service
systemctl disable livesys-late.service
systemctl disable livesys.service
systemctl disable rpcbind.service
systemctl disable lvm2-monitor.service
systemctl disable NetworkManager-wait-online.service
#Fix_Suspend_for_Gigabyte_Aorus_Elite_v2_B550
echo -e "Fix Suspend for Gigabyte Aorus Elite v2 B550" && sudo cp wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service && sudo systemctl start wakeup-disable_GPP0.service
#corectrl
sudo cp 90-corectrl.rules /etc/polkit-1/rules.d/
#Fix_rgb_logitech_g213
mkdir /home/bunnysword/.config/OpenRGB && cp 1.orp /home/bunnysword/.config/OpenRGB/
#mkdir -p /home/bunnysword/.config/systemd/user/ && cp openrgb.service /home/bunnysword/.config/systemd/user/ && systemctl --user enable --now openrgb.service
#Other
neofetch && cp config.conf /home/bunnysword/.config/neofetch/ && neofetch
#steam-presence
git clone https://github.com/JustTemmie/steam-presence && cd /steam-presence &&

