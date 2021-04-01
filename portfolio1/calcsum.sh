# Student name: Joel Belton (10523443)

#!/bin/bash

sum=$(( $1 + $2 + $3 )) # declare variable to store the sum of the 3 integers
[ $sum -le 30 ] && echo "The sum of $1 and $2 and $3 is $sum" && exit 0 # if sum is less than 30, output the sum calculation and exit the script
echo "Sum exceeds maximum allowable"; exit 1 # otherwise grant max sum exceeded and exit the script with error code 1