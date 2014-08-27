#!/bin/bash
echo "$1"
echo "Hello World"

mkdir tempStoreOfRepo
git clone https://github.com/hackreactor/2014-07-toy-problems.git tempStoreOfRepo/
if [ "$#" = 0 ]; then
  open ./tempStoreOfRepo
fi

if [ "$#" = 1 ]; then  
  open ./tempStoreOfRepo/$1/$1.js
fi

echo "Add your solution code..."
echo "Are you ready to push the solution? (y/n)"
read  finished_variable
echo "Removing the file"
rm -rf ./tempStoreOfRepo/