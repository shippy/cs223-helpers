#!/bin/bash

# Submits all files in directory if their last-modified timestamp is newer than the on-server 
hw_n=$(pwd -P | tail -2c)
if [[ ! $(pwd -P) =~ ^/home/classes/cs223/class/.+$ ]] ; then
	echo "Aborting: You are currently not in class directory."
	exit 1
fi
# server_files=$(/c/cs223/bin/check $hw_n)
# Issue: after output of above-command is stored, grep treats it as one line.
#  (unimportant, but reusing the check command violates DRY. Whatever.)
for f in *.c *.h *.log *.txt [Mm]akefile
do
	if [[ ! -L $f &&  ! $f =~ \* ]] # not symlink, not a catch-all
	then
		# Does the file exist on-server? Ask about it (prevent submitting junk)
		if [[ -z `/c/cs223/bin/check $hw_n | grep $f` ]] ; then
			echo "File $f does not exist on server!"
			read -p "$f has not been submitted yet. Submit? (yn)" yn
			case $yn in
				[Yy]* ) /c/cs223/bin/submit $hw_n $f; continue;;
				[Nn]* ) continue;;
				* ) echo "Please type y or n."
			esac
		fi
		
		## Compare submission time and last-modified timestamp of file in folder
		# Get datetime of submission & last-modified
		server_datetime=$(/c/cs223/bin/check $hw_n | grep $f | egrep -o '([A-Z][a-z]{2} [ 0-9]{2} [ 0-9]{2}:[0-9]{2})')
		local_datetime=$(date -r $f "+%h %d %R") 

		# Convert to timestamp for easy comparison
		# (Not picking local timestamp directly because submit script
		# returns submission time in datetime format rounded to minutes)
		server_stamp=$(date -d "$server_datetime" +%s)
		local_stamp=$(date -d "$local_datetime" +%s)

		echo "$f: Last submitted on $server_datetime; last modified on $local_datetime."

		if [[ $server_stamp -lt $local_stamp ]]
		then
		#	echo "-> Submitting $f!"
			/c/cs223/bin/submit $hw_n $f
		else
			echo "-> Server version of $f is up to date."
		fi
	fi
done
