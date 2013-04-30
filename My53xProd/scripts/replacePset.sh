#!/bin/bash
set -x

crab_workdir=$1

### pset=$(awk -F= '/pset/ { print $2 }' $crab_workdir/share/crab.cfg)
### 
### cp -p $pset $crab_workdir/share/CMSSW.py
### 
cd $crab_workdir/share
### 
### mkdir tmp
### tar zxfC default.tgz tmp
### mv CMSSW.py tmp
### rm tmp/CMSSW.py.pkl

cd tmp 
tar zcf ../default.tgz *
cd ..
rm -r tmp

