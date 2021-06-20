#!/bin/bash
clear 

log_file=$1
# domain=$2

echo Analyzing log file: "$log_file"


function top_10_ips {
	cat $log_file | awk '{ print $1 }' | sort | uniq -c | sort -nr | head -n 10
}

#2. Top 10 referrers:

function top_10_refs {
    echo Total visit of $domain : 
    cat $log_file | egrep $domain | awk -F\" '{ print $4 }'| grep -v '-'| wc -l;
    cat $log_file | egrep $domain | awk -F\" '{ print $4 }'| grep -v '-'| sort | uniq -c | sort -nr | head -n 10;
}


#3. Top user-agent:

function top_user_agent {
	cat $log_file | awk -F\" '{ print $6 }' | sort | uniq -c | sort -nr | head -n 10
}


#4. Reqs per day:

function reqs_per_day {
	awk '{ print $4 }' $log_file | cut -d: -f1 | uniq -c | wc -l
}

#5. Total unique visitors:

function total_uniq_visitors {
	cat $log_file | awk '{ print $1 }' | sort | uniq -c | wc -l
}

#6. Most popular URLs

function most_pop_urls {
	cat $log_file | awk '{ print $7 }' | sort | uniq -c | sort -nr | head -n 10
}

#7. Sorted number of visit per IP

function visit_per_ip {
	cat $log_file | awk '{print "requests from " $1}' | sort | uniq -c | sort -nr | less
}



while true
do
    echo 
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
    read choice


    case $choice in

        1)top_10_ips;;
        2)echo Enter domain to search:;read domain; top_10_refs;;
        3)top_user_agent;;
        4)reqs_per_day;;
        5)total_uniq_visitors;;
        6)most_pop_urls;;
        7)visit_per_ip;;
        *)echo Invalid selection;;

    esac



done