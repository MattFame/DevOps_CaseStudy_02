#!/bin/bash

user=$(whoami)

sudo echo "welcome $user"

# files=$(ls) 

if [[ -e AccessLog.txt ]]; then
    #declare -i lineNumber=$(cat AccessLog.txt | wc -l)
    
    lineNumber=$(cat AccessLog.txt | wc -l)

    lineNumber=$(($lineNumber+1))
    
    $(echo -e "$lineNumber $user $(date)" >> AccessLog.txt)
else
    echo "Creating AccessLog.txt..."
    touch AccessLog.txt
    echo "1 $user $(date)" >> AccessLog.txt
fi

which python3

# if [[ $PATH = *"python3"* ]]; then
# if [[ $PATH =~ "python3"]]; then
if [[ $? == 0 ]]; then
    echo "You have Python in the PATH..."
else
    echo "Installing Python3..."
    sudo yum install -y python3.x86_64
    
fi

git --version

if [[ $? == 0 ]]; then
    echo "You have Git installed"
else
    echo "Installing Git..."
    sudo yum install -y git
fi


if [[ -e phone_book.py ]]; then
    python3 dummy_project/phone_book.py
else
    echo "Cloning phone_book.py..."
    sudo git clone https://github.com/MattFame/dummy_project.git
    python3 dummy_project/phone_book.py
fi
