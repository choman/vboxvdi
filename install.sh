#!/bin/bash

##SERVERIP=192.168.2.50

echo "Dpkg::Progress-Fancy \"1\";" | sudo tee /etc/apt/apt.conf.d/99progressbar

#
# setup ppas
sudo add-apt-repository -y ppa:saiarcot895/myppa
sudo add-apt-repository -y ppa:git-core/ppa

#
# update repo and install prereqs
sudo apt-get update -qq
sudo apt-get install -y di git axel ssh apt-fast vlock tmux

#####################################
# need silent install of apt-fast
#####################################

#
# update system 
sudo apt-fast dist-upgrade -y


# install hypervisor
sudo apt-fast install -y python-pytimeparse python-yaml ipvsadm meld

sudo mkdir -p /opt/vboxvdi
sudo cp -pr * /opt/vboxvdi
echo "vdiadmin ALL=(ALL) NOPASSWD: /opt/vboxvdi/ipvsadd.sh" to /etc/sudoers


#VBOX
echo "deb http://download.virtualbox.org/virtualbox/debian yakkety contrib" | sudo tee /etc/apt/sources.list.d/vbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get install -y virtualbox-5.1

#LYNIS
aria2c -x 8 https://cisofy.com/files/lynis-2.4.6.tar.gz
sudo tar xvpf lynis-2.4.6.tar.gz -C /opt


#
# secure system
echo "Securing Logon Screen"
sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf > /dev/null <<EOF
allow-guest=false
greeter-show-manual-login=true
greeter-hide-users=true    
EOF



# UFW setup

#
# Create VDI User
vdipass='$6$VULZjok1$8V7YYoddIJ23UCSQYI1Xua63ES1Qs6gJuWjt2HWAZCBmjJPqndQVgWBZfJ1HRosKfYpQE1ZUNqXffaaonj/6g/'
VDI_SSH_HOME=/home/VDI/.ssh
sudo useradd -s /bin/bash -m vdiadmin -p $vdipass

sudo mkdir -v /vdi 
sudo chown vdiadmin:vdiadmin /vdi 

# setup VDI users for sudo
##line=$(grep VDI ${KVMDIR}/hypervisors/sudoers)
##sudo sed  -i "/^root/ a  $line" /etc/sudoers


sudo reboot
