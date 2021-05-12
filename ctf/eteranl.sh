#!/bin/bash


#eternal loop htb misc challenge
main="../zip/Eternal_Loop.zip"
# main=$(ls zip/*.zip)
pass1="hackthebox"
unzip -o -P $pass1 $main
#clear working directory
# mv ./*.zip "./zip/"


crackCurrentZip(){
	currentZip=$(ls *.zip)
	zip2john $currentZip > "$currentZip.hash"

	currentHash="$currentZip.hash"
	#crack the password
	john  $currentHash
	password=$(john --show $currentHash | cut -d':' -f1 | cut -d'/' -f2 | head -n 1 | cut -d'.' -f1)

	echo -n "pass : |$password|"

	echo -e "\ncurrent zip : |$currentZip|\n"

	# password="5900"
	# currentZip="37366.zip"
	unzip -o -P $password $currentZip
}

while [ $(find ./ -name "*.zip*" | wc -l) != 0 ]; do
	mv $currentZip ./../zip/
	mv $currentHash ./../hash/
	crackCurrentZip	
done



#6969 :) HTB{z1p_and_unz1p_ma_bruddahs}