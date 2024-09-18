#!/bin/bash


# Created by Owen Sterling
# Make sure your assembly file and this script are in the same folder/directory
# Make sure you are inside that directory
# Run the following command in your terminal (dont include the #)

#chmod 700 builder.sh


# check if yasm is installed
if ! command -v yasm &> /dev/null
then
    read -p "yasm was not found, would you like to install it? [Y/n]: " install
    # to use regex in a conditional use [[]]
    if [[ "$install" =~ ^[yY]$ ]]; then
        sudo apt install yasm
    else
    # exit program as unsuccessful if yasm was not installed
        exit 1
    fi
fi

# prompt for assembly filename
read -p "Enter in your assembly filename (without extension): " filename
if [[ -z "$filename" ]]; then
    # exit program as unsuccessful if no filename was given
    echo "No filename specified."
    exit 1
fi

# assemble the .asm file
if ! yasm -g dwarf2 -f elf64 "$filename.asm" -l "$filename.lst"; then
    # exit program as unsuccessful if the filename/current directory is incorrect
    echo "No such file or directory."
    echo "HINT: remove file extension from argument."
    echo "HINT: change directory to where the file is located."
    exit 1
fi

echo "WROTE TO: $filename.asm"
echo "WROTE TO: $filename.lst"

# link the .o file to an executable
if ! ld -g -o "$filename" "$filename.o"; then
# exit program as unsuccessful if the linker could not run
    echo "Could not link $filename.o"
    exit 1
fi

echo "LINKED: $filename.o to $filename"

# prompt the user to run the executable
read -p "Would you like to run $filename? [Y/n]: " run
if [[ "$run" =~ ^[yY]$ ]]; then
    if ! ./"$filename"; then
    # exit program as unsuccessful if the executable could not be ran
        echo "Could not run executable"
        exit 1
    fi
fi

# ask to open DDD (Data Display Debugger)
read -p "Would you like to open DDD (Data Display Debugger)? [Y/n]: " debug
if [[ "$debug" =~ ^[yY]$ ]]; then
    if ! ddd "$filename"; then
    # exit program as unsuccessful if the debugger could not open
        echo 'Could not open ddd debugger'
        exit 1
    fi
fi

# exit code 0 if the program was executed successfully
exit 0