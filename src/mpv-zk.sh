#!/bin/bash
 
# Small zenity/kdialog GUI for mpv.
# Created by coreb1te (coreb1te@yahoo.co.uk)
# Licensed by GPL v.2
# Last update: 08-07-2014
# --------------------------------------
VERSION=0.1
 
 # mpv command.
 PLAYER='mpv --load-unsafe-playlists'
 
 # Check if xterm is installed and define the command used.
 xterm -help > /dev/null
 if [ "$?" -eq 0 ] ; then
     COMMAND="xterm -title mpv -fa Monospace -fs 10 -e $PLAYER"
 else
     COMMAND=$PLAYER
 fi
     
 # If the variable $1 exists run the $COMMAND directly.    
 if [ -f "$1" ]; then
     $COMMAND "$1"
     exit 0
 fi
 
  function printf(){
  echo "$1"
  }
  
  # Check if kdialog is installed 
  function check_if_kdialog(){
 
  kdialog --help > /dev/null
  if [ "$?" -eq 0 ] ; then
  
    VIDEO=$(kdialog --title "Select a video/audio file" --getopenfilename /)
    if [ "0" = "$?" ]; then
        $COMMAND "$VIDEO"
    elif [ "1" = "$?" ]; then
       kdialog --title "mpv" --error "No selected video"
       exit
    fi
    
  else
    check_zenity
  fi
  }
 
 # Check if zenity is installed.   
 function check_zenity(){
 
  zenity --help > /dev/null
  if [ "$?" -eq 0 ] ; then
     
    VIDEO=$(zenity --file-selection --title "Select a video/audio file")
    if [ "0" = "$?" ]; then
        $COMMAND "$VIDEO"
    elif [ "1" = "$?" ]; then
       zenity --error --title "mpv" --text "No selected video"
       exit
    fi
    
  else
    error
  fi
 }

 # Show the error message.
 function error(){
 
 printf ""
 printf "mpv-zk $VERSION"
 printf ""
 printf "Error: zenity or kdialog are not installed!"
 printf ""
 printf "You can only run as follows:"
 printf ""
 printf "$0 <video/audio file>"
 printf""
 
 }
 
 # Init the script.
 check_if_kdialog
