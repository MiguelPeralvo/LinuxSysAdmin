#!/bin/bash

#Author: Ben Whaley / Unix And Linux System Administration Handbook
#Syntax check
if [[ $# != 1 || $1 == "-h" ]]; then
  echo "Usage: $0 /etc/passwd"
  exit 1
fi

#Read command line argument into a variable
file=$1

parse_prompt() {

  until [[ "${answer}" =~ yes|no ]] ; do
    echo "Do you wish to parse ${file} (yes/no)?"
    read answer
  done
  if [[ ${answer} =~ no ]]; then
    echo "Exiting..."
    exit
  fi
}

parse_prompt

# Example line that we are parsing
# puppet:x:52:52:Puppet:/var/lib/puppet:/sbin/nologin

# Sort the file by UID
# Loop through each line and match desired fields

sort -t ':' -k 3 -n $file | while read -r line; do
  # Obtain the user name, UID and homedir by parsing the line with cut
  user=$(echo $line | cut -f '1' -d ':')
  uid=$(echo $line | cut -f '3' -d ':')
  homedir=$(echo $line | cut -f '6' -d ':')
  echo "User ${user} has UID ${uid} and home directory ${homedir}"

  # use an if statement and a regex to print whether the user has a UID of at least 3 digits
  if [[ $uid =~ [0-9]{3} ]]; then echo "  This user has UID with at least 3 digits!"; fi

done
