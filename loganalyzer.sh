#!/bin/bash
clear 

log_file=$1
domain=$2

echo Analyzing log file: "$log_file"


echo Please choose an option:
echo
echo "1) Top 10 IPs"
echo "2) Top 10 referrers"
echo "3) Top user-agent"
echo "4) Requests per day"
echo "5) Total unique visitors"
echo "6) Most popular URLs"
echo "7) Sorted number of visit per IP"
echo
read CHOICE
echo You chose $CHOICE