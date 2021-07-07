#!/bin/bash

AFLAGS="--allow-overwrite=true --auto-file-renaming=false --conditional-get=true"

function header {
	echo "hello"
}

function download_files {
	src="$1"
	aria2c -x 8 "$AFLAGS" -d extfiles/ "${src}"
}

src="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
download_files "${src}"

echo "Dpkg::Progress-Fancy \"1\";" | sudo tee /etc/apt/apt.conf.d/99progressbar

#
# setup ppas
sudo add-apt-repository -y ppa:saiarcot895/myppa
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:webupd8team/terminix

#
# update repo and install prereqs
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-fast
sudo cp -v files/apt-fast.conf /etc
sudo cp -v /usr/share/bash-completion/completions/apt-fast /etc/bash_completion.d/

#
# update repo and install prereqs
sudo apt-fast update -qq
sudo apt-fast install -y di git axel ssh apt-fast vlock tmux

#####################################
# need silent install of apt-fast
#####################################
./clean.sh

#
# update system
sudo apt-fast dist-upgrade -y

# install hypervisor
sudo apt-fast install -y python-pytimeparse python-yaml python-setuptools pandoc \
	python-lockfile python-daemon ipvsadm meld terminix

# firewall stuff
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 3389

#VBOX
echo "deb http://download.virtualbox.org/virtualbox/debian yakkety contrib" | sudo tee /etc/apt/sources.list.d/vbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-fast update -qq
sudo apt-fast install -y virtualbox-5.1

aria2c -x 8 -d /tmp http://download.virtualbox.org/virtualbox/LATEST.TXT
version=$(cat /tmp/LATEST.TXT)
##aria2c -x 8 "$AFLAGS" "http://download.virtualbox.org/virtualbox/${version}/Oracle_VM_VirtualBox_Extension_Pack-${version}.vbox-extpack"
src="http://download.virtualbox.org/virtualbox/${version}/Oracle_VM_VirtualBox_Extension_Pack-${version}.vbox-extpack"
download_file "$src"

# prompts for passwd
sudo vboxmanage extpack install "extfiles/Oracle_VM_VirtualBox_Extension_Pack-${version}.vbox-extpack"

# Install LYNIS
sudo git clone https://github.com/CISOfy/lynis.git /opt/lynis

#
# install pyvbox
git clone https://github.com/mjdorma/pyvbox
(
	pushd pyvbox || echo "Unable to change dirs"
	sudo python setup.py install
	popd || echo "Unable to return dirs"
)

sudo unzip -d /usr/local/bin packer_0.12.3_linux_amd64.zip

#
# secure system
echo "Securing Logon Screen"
sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf >/dev/null <<EOF
allow-guest=false
greeter-show-manual-login=true
greeter-hide-users=true
EOF

# vboxvdi service
echo "Setup service"
sudo -s cp -v files/vboxvdi.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable vboxvdi
sudo systemctl start vboxvdi
sudo systemctl status vboxvdi

# UFW setup

#
# Create VDI User
# shellcheck disable=SC2016
vdipass='$6$VULZjok1$8V7YYoddIJ23UCSQYI1Xua63ES1Qs6gJuWjt2HWAZCBmjJPqndQVgWBZfJ1HRosKfYpQE1ZUNqXffaaonj/6g/'
# shellcheck disable=SC2034
VDI_SSH_HOME=/home/VDI/.ssh
sudo useradd -s /bin/bash -m vdiadmin -p $vdipass
sudo usermod -a -G vboxusers vdiadmin,root
sudo usermod -a -G vboxusers "$USER"
sudo usermod -a -G vdiadmin "$USER"

# setup vboxvdi
sudo mkdir -p /opt/vboxvdi
sudo rsync -uav config.yml.tmpl ipvsadmin.sh vboxvdi /opt/vboxvdi
sudo chown -R vdiadmin:vdiadmin /opt/vboxvdi
echo "vdiadmin ALL=(ALL) NOPASSWD: /opt/vboxvdi/ipvsadmin.sh" | sudo tee -a /etc/sudoers

# setup /vdi directory
sudo mkdir -v /vdi
sudo chown -R vdiadmin:vdiadmin /vdi
sudo -i -u vdiadmin /usr/bin/vboxmanage setproperty machinefolder /vdi

# setup VDI users for sudo
##line=$(grep VDI ${KVMDIR}/hypervisors/sudoers)
##sudo sed  -i "/^root/ a  $line" /etc/sudoers

sudo reboot
