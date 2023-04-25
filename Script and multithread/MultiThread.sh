#!/bin/bash

function check_number {
    if (( $1 % 2 == 0 )); then
        echo "$1 is even"
    else
        echo "$1 is odd"
    fi
}


function check_year {
    if (( $1 % 4 == 0 && ( $1 % 100 != 0 || $1 % 400 == 0 ) )); then
        echo "$1 is a leap year"
    else
        echo "$1 is not a leap year"
    fi
}


check_number_thread() {
    check_number $1
}
check_year_thread() {
    check_year $1
}

number=10
year=2024
echo "Checking if $number is odd or even and if $year is a leap year..."
{ check_number_thread $number; } &
{ check_year_thread $year; } &

wait

