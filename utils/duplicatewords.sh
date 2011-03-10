#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Finds duplicate words between wordlists"
	echo "Usage: $0 <file1> <file2>...";
	exit 3;
fi


sort <(cat "$@") | uniq -c | sed -e 's/^ *//' | egrep -v '^1 ' | sort -n

