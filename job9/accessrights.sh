#!/bin/bash

#while IFS="," read id prenom nom mdp role
#do
#	echo "id:$id prenom:$prenom nom:$nom mdp:$mdp role:$role"
#done < Shell_Userlist.csv

#OLDIFS=$IFS
#IFS=","

cat /home/nedh/shell-exe/job9/Shell_Userlist.csv | while read varligne
do
    password=`echo $varligne |cut -d ',' -f4`
    username=`echo $varligne |cut -d ',' -f2`
    username=`echo ${username,,}`
    role=`echo $varligne |cut -d ',' -f5`
    
    if [ ${role:0:5} = "Admin" ]
    then
        echo "creation de l'utilisateur : $username"
        #sudo useradd -m -d /home/$username $username
        sudo useradd -m $username -p $password
        echo "changement du role de : $username"
        sudo usermod -aG sudo $username
    else 
        echo "creation de l'utilisateur : $username"
        sudo useradd -m $username -p $password
    fi
done < <(tail -n +2 Shell_Userlist.csv)
