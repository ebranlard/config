#!/bin/bash
mkdir -p MatlabPath
# mkdir -p PythonPath

cd MatlabPath

git init .
git remote add origin http://github.com/ebranlard/matlab-path.git
git pull origin master

# cd PythonPath
# 
# git init
# git remote add origin http://github.com/ebranlard/pybra.git
# git pull origin master
