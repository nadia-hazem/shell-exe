#!/bin/zsh
cd ~/Documents/laplateforme/shell-exe/job8

rm number_connection-*
last -f /var/log/wtmp | grep $USER | wc -l > number_connection-`date +%d-%m-%Y-%H-%M`

tar -uvf Backup/log.tar number_connection-*



