
#!/bin/bash

#title           :bcp.sh
#description     :This script creates a timestamped "backup" copy of a directory.
#author   :Jonathan N. Winters, jnw25@cornell.edu
#date            :20170409
#version         :0.1   
#usage   :bash bcp.sh [directory]
#notes           :to install, move this script to /usr/local/bin/bcp
#bash_version    :N/A

# create date string with format YYYYmmddHHMMSS
DATE=`date +%Y%m%d%H%M%S`

# get the current working directory folder name
basename=`basename "$PWD"`

# if no path or . is provided as parameter then set destination directory to one-up ".." 
# and set the output directory name to the base name of working directory
if [[ $1 = "." ]]; then
 # "The current directory will be copied"
 src="../"$basename
 dest="../"$basename-$DATE
elif [[ -z "$1"  ]]; then
 # "No directory was specified. The current directory will be copied."
 src="../"$basename
 dest="../"$basename"-"$DATE
else
 # "a dir was entered in $1" 
 # strip trailing / off of dir name
 directory=$1
 lastchar="${directory: -1}"
 if [[ $lastchar = "/" ]]; then
  directory=${directory::-1}
 fi
 src=$1
 dest=$directory-$DATE
fi

# copy directory to directory with same name + date and time stamp
cp -Rp $src $dest
