#!/bin/sh

echo -e "\e[36mBuilding lightdm-bozanic"
echo -e "\e[0m"

echo "Removing old copy of LightDM theme..."
sudo rm -rf /usr/share/lightdm-webkit/themes/bozanic/*
echo "Done"

echo "Running Vue setup..."
sudo rm -r dist/
npm run-script build
echo "Done"

echo "Building directory..."
pushd dist && tar zcvf ../lightdm-bozanic.tar.gz ./* && popd
sudo mkdir -p /usr/share/lightdm-webkit/themes/bozanic/
sudo mv lightdm-bozanic.tar.gz /usr/share/lightdm-webkit/themes/bozanic/ 
echo "Done"

echo "Entering directory and running final decompression..."
cd /usr/share/lightdm-webkit/themes/bozanic/
sudo tar xvf lightdm-bozanic.tar.gz
echo "Done"

echo "All done!"
