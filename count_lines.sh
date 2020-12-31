#!/bin/bash
# Simple line count example, using bash
# give permissions:
# chmod +x count_lines.sh
# Usage: ./count_lines.sh file
# -----------------------------------------------------------------------------

# Link filedescriptor 10 with stdin
exec 10<&0
# stdin replaced with a file supplied as a first argument
exec < $1
# remember the name of the input file
in=$1

# init
file="myfile.txt"
let count=0

# this while loop iterates over all lines of the file
while read LINE
do
    # increase line counter 
    ((count++))
done

echo "Number of lines: $count"

# restore stdin from filedescriptor 10
# and close filedescriptor 10
exec 0<&10 10<&-