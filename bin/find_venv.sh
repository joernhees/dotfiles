#! /bin/bash
# script that searches a python venv dir, identified by bin/activate
#set -x

for d in {.,..}/{venv,virt_env}/{,2*/,py2*/}bin/activate ; do
	if [[ -f "$d" ]] ; then
		# echo "echo activating venv: \"$d\""
		echo "source \"$d\""
		exit 0
	fi
done
echo "echo \"none found\""
exit 1
