#!/bin/bash
mkdir -p MatlabPath
mkdir -p PythonPath

cd MatlabPath

git init .
git remote add origin http://github.com/elmanuelito/matlab-path.git
git pull origin master
