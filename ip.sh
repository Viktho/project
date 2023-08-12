#!/bin/bash

echo "-------------------------------"
echo "Simple Port Scanner Script"
echo "-------------------------------"

echo "What is your name, boss?:"
read -r user

# Check if the input contains only alphabetic characters
if [[ $user =~ ^[[:alpha:]]+$ ]]; then
    echo "Hey $user"
else
    echo "Error: Only string input is allowed."
    exit 1
fi

echo -e "\n"

echo "Enter Target:"
read Target
# Regular expression to match IPv4 address pattern
ipv4_regex='^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'

# Check if the input matches the IPv4 pattern
if [[ $Target =~ $ipv4_regex ]]; then
    echo "Valid IPv4 address: $Target"
else
    echo "Error: Invalid IPv4 address."
    exit 1
fi

echo -e "\n"

echo "HaHa $user sha ma rora" 
echo "oya gbe me de be make i check whether the target dey active"
ping -c 3 $Target
echo "Do you want to check for open port $user?"

echo "option:
1. yes 

2.  no"

echo "Input your answer:"
read -r answer

if [ "$answer" == "yes" ]
then
echo "make i quickly run am ni gba yen to save you from stress" 

echo "what type of network scanner you wan use?"

echo " option:
 1. rustscan >>> user needs to install rustscan to use this scanner https://github.com/RustScan/RustScan/wiki/Installation-Guide
 
 2. nmap 
 
 3. nc (running only standard port)"
echo "Input your answer:"
read -r "scanner" ## i dey ask the user to enter the input hin want

if [ "$scanner" == "rustscan" ]

then

echo "wasere omo ogbon , that nmap dey slow somehow"

rustscan $Target -- -sC -sV -Pn

elif

[ "$scanner" == "nmap" ]

then

echo " b lyk say you get patience gan ni ooo"

sudo nmap -sS -p 1-65535 -T4 -v -oN nmap_scan_results.txt $Target

elif

[ "$scanner" == "nc" ]

then

echo " running standard ports only"
echo " RUNNING..................."
echo -e "\n"

host=$Target

start_port=1

end_port=1024

for ((port=start_port; port<=end_port; port++))
do
  (echo >/dev/tcp/$host/$port) >/dev/null 2>&1 && echo "Port $port is open"
done

fi

else

[ "$answer" == "no" ]
echo "dey play ni gba yen"

fi
