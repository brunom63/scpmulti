#!/usr/bin/env bash

#
# Automatic SCP files to cloned servers using PEM ssh key
# Fill out commented variables below
#
# Usage: scpmulti FILE_ADDRESS
#

sshkey=""             # SSH PEM key location
localaddr=""          # Local root folder of project (Include trailing "/")
remoteaddr=""         # Remote folder of project (Include trailing "/")
user=""               # Login username
servers[0]=""         # Server 1 IP or Domain
servers[1]=""         # Server 2 IP or Domain -- Add more servers below if needed
addr=""

echo ""

if [ $# -eq 0 ]; then
  echo -n "Filename: "
  read addr
else
  addr=$1
  echo "Filename: "$addr
fi

echo ""

if [ ! -f $localaddr$addr ]; then
  echo "File not found."
  exit 0
fi

for server in "${servers[@]}"
do
  echo $server:$addr
  scp -i $sshkey $localaddr$addr $user@$server:$remoteaddr$addr
done

echo ""

exit 0
