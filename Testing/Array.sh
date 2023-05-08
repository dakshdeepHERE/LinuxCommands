#!/bin/bash

# prompt the user to enter the number of elements in the array
read -rp "Enter the number of elements in the array: " n

# declare an empty array
arr=()

# read each element of the array from the user
for (( i=0; i<n; i++ ))
do
  read -rp "Enter element $((i+1)): " element
  arr+=("$element")
done

# print the entire array
echo "The array is: ${arr[@]}"

