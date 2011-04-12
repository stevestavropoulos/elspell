#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Makes proper wordlist from multiple wordlists"
	echo "Usage: $0 <file1> <file2>..."
	exit 3
fi

export LC_ALL=C

cat "$@" | sed -e 's///g' -e 's/ //g' | sort -u

