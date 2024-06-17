#!/bin/bash

#nvutils
#flatpak install flathub com.leinardi.gwe
#nvdriver
#####555.42
sudo dnf in -y https://koji.rpmfusion.org/kojifiles/packages/nvidia-kmod/555.42.02/1.fc41/x86_64/akmod-nvidia-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/i686/xorg-x11-drv-nvidia-cuda-libs-555.42.02-1.fc41.i686.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/i686/xorg-x11-drv-nvidia-libs-555.42.02-1.fc41.i686.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-cuda-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-cuda-libs-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-kmodsrc-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-libs-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/555.42.02/1.fc41/x86_64/xorg-x11-drv-nvidia-power-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-modprobe/555.42.02/1.fc41/x86_64/nvidia-modprobe-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-settings/555.42.02/1.fc41/x86_64/nvidia-settings-555.42.02-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-persistenced/555.42.02/1.fc41/x86_64/nvidia-persistenced-555.42.02-1.fc41.x86_64.rpm
####555.52
#sudo dnf in -y rpmfusion-nonfree-release-rawhide
#sudo dnf --enablerepo=rpmfusion-nonfree-rawhide install akmod-nvidia-open xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686 --nogpgcheck 
####550
#sudo dnf in -y gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power
#sudo dnf in -y xorg-x11-drv-nvidia-libs.i686
####
sudo cp nvidia-kms.conf /etc/modprobe.d/
