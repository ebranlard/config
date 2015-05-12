#!/bin/bash
mkdir -p MatlabPath
mkdir -p PythonPath

cd MatlabPath

git init .
git remote add origin git@github.com:elmanuelito/matlab-path
git pull origin master
