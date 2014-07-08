#!/bin/bash

# Install mpv-zk
# Created by coreb1te (coreb1te@yahoo.co.uk)
# Licensed by GPL v.2
# Last update: 08-07-2014
# --------------------------------------

PREFIX=/usr
INSTALL_BIN=$PREFIX/bin
INSTALL_DESKTOP_FILE=$PREFIX/share/applications
INSTALL_ICON=$PREFIX/share/icons/hicolor/64x64/apps
PREFIX_LOCAL=/usr/local
INSTALL_LOCAL_DESKTOP_FILE=$PREFIX_LOCAL/share/applications

  function printf(){
  echo "$1"
  }
  
 # Check if the script is executed as root.
  ls /root/ > /dev/null
  if [ "$?" -eq 0 ] ; then
  printf ""
  else
    if [ $USER != root ]; then
      clear
      printf ""
      printf "Error: must be root"
      printf "Exiting..."
      printf ""
     exit 0
    fi
  fi
  
  function install_mpv_zk(){
  
  clear
  mkdir -p $INSTALL_BIN
  mkdir -p $INSTALL_DESKTOP_FILE
  mkdir -p $INSTALL_ICON
  rm -rf $INSTALL_LOCAL_DESKTOP_FILE/mpv.desktop
  cp -rf src/mpv-zk.sh $INSTALL_BIN
  printf "Installed $INSTALL_BIN/mpv-zk.sh"
  cp -rf src/mpv.desktop $INSTALL_DESKTOP_FILE
  printf "Installed $INSTALL_DESKTOP_FILE/mpv.desktop"
  cp -rf src/mpv.png $INSTALL_ICON
  printf "Installed $INSTALL_ICON/mpv.png"
  chmod 755 $INSTALL_BIN/mpv-zk.sh
  chmod 755 $INSTALL_DESKTOP_FILE/mpv.desktop
  
  }
  
  function uninstall_mpv_zk(){
  
  clear
  rm -rf $INSTALL_BIN/mpv-zk.sh
  printf "Deleted $INSTALL_BIN/mpv-zk.sh"
  rm -rf $INSTALL_DESKTOP_FILE/mpv.desktop
  printf "Deleted $INSTALL_DESKTOP_FILE/mpv.desktop"
  rm -rf $INSTALL_ICON/mpv.png
  printf "Deleted $INSTALL_ICON/mpv.png"
  
  }
  
  case $1 in
    
    --uninstall|-uninstall)
          uninstall_mpv_zk
          ;;
    --help|-h|-help)
          clear
          printf ""
          printf "$0 -> to install"
          printf "$0 --uninstall -> to uninstall"
          printf "$0 --help -> show help"
          printf
          ;;
    --install|-install|*)
          install_mpv_zk
  esac
