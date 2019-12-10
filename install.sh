#! /usr/bin/env bash


# test wether rsnapshot is installed
if [ -z `which rsnapshot` ] ; then

    printf "The program 'rsnapshot' cannot be found.\
please install 'rsnapshot' first, before you execute\
this script."
    exit 2
fi
if [ -z `which sed` ] ; then

    printf "The program 'sed' cannot be found.\
please install 'rsnapshot' first, before you execute\
this script."
    exit 2
fi

if [[ `id -u` -eq 0 ]] ; then

    echo "You should not execute this script as root"
    exit 3
fi

# Defaultls
if [ -z $USB_B_INSTALL_LOC ] ; then
    USB_B_INSTALL_LOC=~/.local/bin
fi

if [ -z $USB_B_CONF_LOC ] ; then
    USB_B_CONF_LOC=~/.conf
fi


sed -i "s/USER/$USERNAME/g" usb_backup.conf

if ![ -d $USB_B_CONF_LOC ] ; then
    mkdir -p $USB_B_CONF_LOC
fi

if ![ -d $USB_B_INSTALL_LOC ] ; then
    mkdir -p $USB_B_INSTALL_LOC
    export $USB_B_INSTALL_LOC:$PATH
fi

if ![ -d ~/.local/share/applications ] ; then
    mkdir -p ~/.local/share/applications 
fi

mv usb_backup.conf $USB_B_CONF_LOC 
chmod +x usb_backup
mv usb_backup $USB_B_INSTALL_LOC
mv USB_backup.desktop ~/.local/share/applications/
