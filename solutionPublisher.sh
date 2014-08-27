#!/bin/bash
echo "$1"
echo "Welcome to the Solution Publisher"

mkdir tempStoreOfRepo
git clone https://github.com/hackreactor/2014-07-toy-problems.git tempStoreOfRepoJunior/
git clone https://github.com/hackreactor/2014-06-toy-problems.git tempStoreOfRepoSenior/

if [ "$#" = 0 ]; then
  open ./tempStoreOfRepoJunior
  open ./tempStoreOfRepoSenior
fi

if [ "$#" = 1 ]; then  
  open ./tempStoreOfRepoJunior/$1/$1.js
  open ./tempStoreOfRepoSenior/$1/$1.js

fi

cd tempStoreOfRepoJunior
git checkout solution
cd ../tempStoreOfRepoSenior
git checkout solution
cd ..

 
echo "Add your solution code..."
echo "Are you ready to push the solution? (y/n)"
read  finished_variable

if [ finished_variable = "y" ]; then
  echo "Pushing the solution branch to GitHub"
  cd tempStoreOfRepoJunior
  git push origin solution
  cd ../tempStoreOfRepoSenior
  git push origin solution
  cd ..

else
  echo "Ok, Goodbye!"
fi

echo "Removing the temporary repository directory"
rm -rf ./tempStoreOfRepoSenior/
rm -rf ./tempStoreOfRepoJunior/
