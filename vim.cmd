@echo off
docker run -ti --rm -v %~dp0:/home chxuan/ubuntu-vimplus vim /home 
