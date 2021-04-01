# Student name: Joel Belton (10523443)

#!/bin/bash

while true; do # declare while loop that will only end with the break command
    read -p "Enter a two digit numeric code that equals 20 or 40: " code # prompt user for 2 digit code (20 or 40)
    if [[ $code =~ ^[0-9]+$ ]] && [[ $code -eq 20 || $code -eq 40 ]]; then # use regex to test input is integer that is 20 or 40
        break # if input is valid, break out of the while loop
    else
        echo "Invalid code entered - please try again" # if invalid input, loop back to prompt
    fi
done

echo "Code entered is valid - thankyou" # grant valid code

exit 0