#!/bin/bash

#mis directin htb misc challenge
echo "" > "flag_"
for dir in $(ls); do
	isEmpty=$(ls $dir | wc -l)
	# echo $isEmpty
	if [ "$isEmpty" -ne 0 ]; then
		for file in  $(ls $dir); do
			echo "$file:$dir" >> "flag_"
		done
	fi
done


flag=""
for char in $(sort -g "flag_" | cut -d":" -f2); do
	flag=$flag$char
done

echo $flag | cut -d"_" -f2 | base64 -d