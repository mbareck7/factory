#!/bin/bash

#Run script as sudo

#Randomize mac, https://udger.com/resources/mac-address-vendor?v=top
#get all vendors MAC identifier

ramdomlySelectOUI(){ #OUI : Organization Unique Identifier
	oui=$(shuf -n 1 "ouis.txt") #find the face "ouis.txt" at https://github.com/mbareck7/scripting/blob/main/mac/ouis.txt
	echo $oui
}

randomizeVendorAssignedAddress(){
	addr=$(openssl rand -hex 3 | sed -e 's/\(..\)\(..\)\(..\)/\1:\2:\3/g' | tr '[a-z]' '[A-Z]')
	echo $addr
} 

# #get vendors names
# curl -i -s -k -X $'GET' -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' $'https://udger.com/resources/mac-address-vendor?v=top' -o page.html
# egrep -o "alt=\"logo\ [[:alnum:]\,\.\ \-]+" page.html | cut -d ' ' -f 2- | sed 's/\(.*\)/\L\1/g; s/\.\|\,//g; s/co_ltd/co-ltd/g; s/coltd/co-ltd/g; s/ /_/g' > names.txt
# #reterview and collect vendors MACs identifiers in the same file vendorsMacsIdentifiers.txt
# while IFS= read -r name ;do curl -i -s -k -X $'GET' -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' $"https://udger.com/resources/mac-address-vendor-detail?name=$name" -o "$name.macs";done < names.txt 
# for file in $(ls *.macs);do egrep -o '<tr><td>([0-9A-F]{2}:){3}' $file | cut -d'>' -f3 ;done > vendorsMacsIdentifiers.txt

changeMAC(){
	oui=$(ramdomlySelectOUI)
	addr=$(randomizeVendorAssignedAddress)
	mac=$(echo "$oui$addr")
#	echo $mac

	#change wlan0 to your network interface name(ex : ether ...)
	sudo ifconfig wlan0 down
	sudo ifconfig wlan0 hw ether $mac
	sudo ifconfig wlan0 up	
}



while true; do 
	changeMAC
	sleep 1260  #60*21
done



# watch -n3 -x $changeMAC
