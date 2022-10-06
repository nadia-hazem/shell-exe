#!/bin/bash

#while IFS="," read id prenom nom mdp role
#do
#	echo "id:$id prenom:$prenom nom:$nom mdp:$mdp role:$role"
#done < Shell_Userlist.csv

#OLDIFS=$IFS
#IFS=","
###########################################################################
cat ~/Documents/laplateforme/shell-exe/job9/Shell_Userlist.csv | while read varligne
do
    password=`echo $varligne |cut -d ',' -f4`
    username=`echo $varligne |cut -d ',' -f2`
    username=`echo ${username,,}`
    role=`echo $varligne |cut -d ',' -f5`
    
    if [ ${role:0:5} = "Admin" ]
    then
        echo "creation de l'utilisateur : $username"
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
	sudo useradd -m -p "$pass" "$username"
        echo "changement du role de : $username"
        sudo usermod -aG sudo $username
    else 
        echo "creation de l'utilisateur : $username"
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
	sudo useradd -m -p "$pass" "$username"
    fi
done < <(tail -n +2 Shell_Userlist.csv)
#######################################################


