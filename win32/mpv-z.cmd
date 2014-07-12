@echo off

rem # Small zenity GUI for mpv on Windows.
rem # Created by coreb1te (coreb1te@yahoo.co.uk)
rem # Licensed by GPL v.2
rem # Last update: 12-07-2014
rem # --------------------------------------
rem # zenity for windows from: 
rem #    https://osspack32.googlecode.com/files/zenity.exe

 set VERSION=0.4
 set MPV_TEST=mpv --help
 set ZENITY_TEST=zenity --help
 set printf=echo

 rem # mpv command.
 set PLAYER=mpv --load-unsafe-playlists

 :checking_mpv_system
   %MPV_TEST%
   if %ERRORLEVEL%==0 goto checking_zenity
   cls
   %printf%.
   %printf% - Error: You must install mpv player -
   %printf%.
   %printf% - Help -
   %printf% * Official website: http://mpv.io
   %printf% * Windows builds: http://mpv.srsfckn.biz/
   %printf%.
   %printf% Press 'ENTER' to exit
   pause > nul
   exit

 :checking_zenity

   %ZENITY_TEST%
   if %ERRORLEVEL%==0 goto mpv_check_input
   cls
   %printf%.
   %printf% - Error: zenity.exe not found! -
   %printf%.
   %printf% - Help -
   %printf% * Zenity for windows:
   %printf%   https://osspack32.googlecode.com/files/zenity.exe
   %printf%.
   %printf% Press 'ENTER' to exit
   pause > nul
   exit

 :mpv_check_input

   cls
   %printf%.
   %printf% mpv-z initialized
   if "%1" EQU "" (goto mpv_play_file) else (goto mpv_play_input)

 :mpv_play_input

   cls
   %printf%.
   %printf% mpv-z initialized
   %printf%. 
   %PLAYER% %1
   exit

 :mpv_play_file  

   cls
   %printf%.
   %printf% mpv-z initialized
   for /f "tokens=*" %%%% in ('zenity --file-selection --title "Select a video/audio file"') do (set FILEPATH=%%~%%)
   %printf%.
   %printf% Selected file: %FILEPATH%
   %printf%.
   %PLAYER% "%FILEPATH%"