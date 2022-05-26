#!/bin/bash
#set -x
#trap read debug

# Creating an IGELOS CP for LLDP
## Development machine (Ubuntu 18.04)

MISSING_LIBS="liblldpctl-dev"

sudo apt install unzip -y
sudo apt install lldpd -y

mkdir build_tar
cd build_tar

for lib in $MISSING_LIBS; do
  apt-get download $lib
done

mkdir -p custom/lldpd

find . -type f -name "*.deb" | while read LINE
do
  dpkg -x "${LINE}" custom/lldpd
done


wget https://github.com/FloMeyer/IGEL-Custom-Partitions/raw/master/CP_Packages/Network/LLDP.zip

unzip LLDP.zip -d custom
mv custom/target/build/lldpd-cp-init-script.sh custom

cd custom

# edit inf file for version number
mkdir getversion
cd getversion
ar -x ../../lldpd_*.deb
tar xf control.tar.*
VERSION=$(grep Version control | cut -d " " -f 2)
#echo "Version is: " ${VERSION}
cd ..
sed -i "/^version=/c version=\"${VERSION}\"" target/lldpd.inf
#echo "lldpd.inf file is:"
#cat target/lldpd.inf

# new build process into zip file
tar cvjf target/lldpd.tar.bz2 lldpd lldpd-cp-init-script.sh
zip -g ../LLDP.zip target/lldpd.tar.bz2 target/lldpd.inf
zip -d ../LLDP.zip "target/build/*" "target/igel/*" "target/target/*"
mv ../LLDP.zip ../../LLDP-${VERSION}_igel01.zip

cd ../..
rm -rf build_tar
