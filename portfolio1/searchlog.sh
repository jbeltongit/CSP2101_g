# Student name: Joel Belton (10523443)

#!/bin/bash

while [[ $REPLY != [Nn] ]]; do # declare while loop that will only end when user inputs N/n
    read -p "What pattern would you like to search for? " pattern # prompt user for search pattern
    read -p "Would you like to search for a whole word match (Y/N)? " match # prompt user for whole word match
    read -p "Would you like to search for an inverted match (Y/N)? " inverted # prompt user for inverted match
    if [[ $match == [Yy] && $inverted == [Yy] && ! -z $(grep -inwv "$pattern" access_log.txt) ]]; then
        echo "$(grep -cinwv "$pattern" access_log.txt) matches found" && grep -inwv "$pattern" access_log.txt && read -p "Would you like to do another search (Y/N)? " # count matching lines in grep and if whole word and inverted match, do grep with -wv options
    elif [[ $match == [Nn] && $inverted == [Nn] && ! -z $(grep -in "$pattern" access_log.txt) ]]; then
        echo "$(grep -cin "$pattern" access_log.txt) matches found" && grep -in "$pattern" access_log.txt && read -p "Would you like to do another search (Y/N)? " # count matching lines in grep and if not whole word and inverted match, do grep with no extra options
    elif [[ $match == [Nn] && $inverted == [Yy] && ! -z $(grep -inv "$pattern" access_log.txt) ]]; then
        echo "$(grep -cinv "$pattern" access_log.txt) matches found" && grep -inv "$pattern" access_log.txt && read -p "Would you like to do another search (Y/N)? " # count matching lines in grep and if only inverted match, do grep with -v option
    elif [[ $match == [Yy] && $inverted == [Nn] && ! -z $(grep -inw "$pattern" access_log.txt) ]]; then
        echo "$(grep -cinw "$pattern" access_log.txt) matches found" && grep -inw "$pattern" access_log.txt && read -p "Would you like to do another search (Y/N)? " # count matching lines in grep and if only whole word match, do grep with -w option
    else
        read -p "No matches found. Would you like to do another search (Y/N)? " # if grep output is empty, grant no matches and prompt user for another search    
    fi
done

exit 0