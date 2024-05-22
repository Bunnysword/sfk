#!/bin/bash

#FOR_KDE_F38+
#configuration dnf
sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in -y dnf-automatic && systemctl enable dnf-automatic.timer
#rpmfusion
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#rm_stok_apps
echo -e "\trm stock apps" && sudo dnf rm -y mediawriter rhythmbox evince yelp totem firefox libreoffice* power-profiles-daemon kolourpaint kmahjongg kmines akregator kmail* konversation ktnef pimdataexporter sieveeditor dragon elisa kamoso kaddressbook kontact korganizer kpat
sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf in -y lame\* --exclude=lame-devel && sudo dnf group upgrade -y Multimedia --with-optional --allowerasing
sudo dnf copr enable -y sentry/kernel-fsync #fsync
sudo dnf copr enable -y principis/NoiseTorch && sudo dnf in -y noisetorch #Noisetorch
sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo && sudo dnf in -y discord #Discord from terra
#Install_Apps
sudo dnf config-manager --set-enabled google-chrome
sudo dnf in -y mangohud timeshift goverlay steam lutris transmission kdenlive vlc htop redhat-lsb-core rocm-opencl inxi neofetch protontricks openssl easyeffects corectrl gimp google-chrome-stable openrgb piper --allowerasing
sudo dnf update -y --refresh
#Flatpak
echo -e "\tFlatpak" && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && flatpak install flathub -y com.heroicgameslauncher.hgl com.obsproject.Studio net.davidotek.pupgui2
#Disable_Services
sudo systemctl mask plymouth-quit-wait.service
systemctl disable livesys-late.service
systemctl disable livesys.service
systemctl disable rpcbind.service
systemctl disable lvm2-monitor.service
systemctl disable NetworkManager-wait-online.service
sudo mv /services/wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service && sudo systemctl start wakeup-disable_GPP0.service #B550 fix
mkdir /home/bunnysword/.config/systemd/ && mkdir /home/bunnysword/.config/systemd/user && mv /services/noisetorch.service /home/bunnysword/.config/systemd/user/
systemctl --user daemon-reload && systemctl --user start noisetorch && systemctl --user enable noisetorch
#Other
mkdir /home/bunnysword/.config/OpenRGB && cp /conf/1.orp /home/bunnysword/.config/OpenRGB/ #OpenRGB
mkdir /home/bunnysword/.config/neofetch && mv /conf/config.conf /home/bunnysword/.config/neofetch/ && neofetch #Neofetch
mkdir /home/bunnysword/.config/MangoHud && mv /conf/MangoHud.conf /home/bunnysword/.config/MangoHud/ #MangoHud
git clone https://github.com/JustTemmie/steam-presence && mv /conf/config.json steam-presence/ && cd steam-presence/ && ./installer.sh && cd ..
#NVIDIAMOMENTO
cd nvdriver/ && chmod 750 nvdriver.sh && ./nvdriver.sh && inxi -G
####sudo grubby --args="gpu_sched.sched_policy=0" --update-kernel=ALL for amd wayland fix
####sudo mv /conf/90-corectrl.rules /etc/polkit-1/rules.d/ #Corectrl rules for amd
####sudo mv /conf/environment /etc && sudo dmesg | grep BAR= #BAR for amd
