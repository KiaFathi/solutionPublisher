#!/bin/bash
echo "$1"
echo "Welcome to the Solution Publisher"

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
git pull origin master
cd ../tempStoreOfRepoSenior
git checkout solution
git pull origin master
cd ..

 
echo "Add your solution code..."
echo "Are you ready to push the solution? (y/n)"
read  finished_variable
if [ "$finished_variable" = "y" ]; then
  echo "Pushing the solution branch to GitHub"
  cd tempStoreOfRepoJunior
  git add .
  
  if [ "$#" = 0 ]; then
    git commit -m "Solution Added"
  fi

  if [ "$#" = 1 ]; then  
    git commit -m"Solution $1 Added"
  fi

  git push origin solution
  cd ../tempStoreOfRepoSenior
  git add .
  if [ "$#" = 0 ]; then
    git commit -m "Solution Added"
  fi

  if [ "$#" = 1 ]; then  
    git commit -m"Solution $1 Added"
  fi
  git push origin solution
  cd ..

else
  echo "Ok, Goodbye!"
fi

echo "Removing the temporary repository directory"
rm -rf ./tempStoreOfRepoSenior/
rm -rf ./tempStoreOfRepoJunior/