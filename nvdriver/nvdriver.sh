#!/bin/bash

#nvdriver
sudo dnf copr enable kwizart/nvidia-driver-rawhide -y
sudo dnf install rpmfusion-nonfree-release-rawhide -y
sudo dnf --enablerepo=rpmfusion-nonfree-rawhide install akmod-nvidia-open xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda --nogpgcheck
sudo cp nvidia-kms.conf /etc/modprobe.d/
#sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power
#sudo dnf install xorg-x11-drv-nvidia-libs.i686
sudo cp nvidia-kms.conf /etc/modprobe.d/
