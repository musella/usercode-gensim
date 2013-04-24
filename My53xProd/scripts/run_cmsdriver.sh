#!/bin/bash

##  cmsDriver.py ZEE_8TeV_cfi  --conditions auto:startup -s GEN,SIM --datatier GEN-SIM -n 10 --relval 9000,100 --eventcontent RAWSIM --fileout file:step1.root  > step1_ZEE+ZEE+DIGI+RECO+ALCAELE.log  2>&1
##  
## 
## # in: /afs/cern.ch/work/m/musella/private/Analysis/CMGTools/Prod_5_3_9_patch3/src/MyGenSim/My53xProd/scripts dryRun for 'cd 29.0_ZEE+ZEE+DIGI+RECO+ALCAELE
##  cmsDriver.py step2  --datatier GEN-SIM-DIGI-RAW-HLTDEBUG --conditions auto:startup -s DIGI,L1,DIGI2RAW,HLT:@relval,RAW2DIGI,L1Reco --eventcontent FEVTDEBUGHLT -n 100  --filein file:step1.root  --fileout file:step2.root  > step2_ZEE+ZEE+DIGI+RECO+ALCAELE.log  2>&1
##  
## 
## # in: /afs/cern.ch/work/m/musella/private/Analysis/CMGTools/Prod_5_3_9_patch3/src/MyGenSim/My53xProd/scripts dryRun for 'cd 29.0_ZEE+ZEE+DIGI+RECO+ALCAELE
##  cmsDriver.py step3  --datatier GEN-SIM-RECO,DQM --conditions auto:startup -s RAW2DIGI,L1Reco,RECO,VALIDATION,DQM --eventcontent RECOSIM,DQM -n 100  --filein file:step2.root  --fileout file:step3.root  > step3_ZEE+ZEE+DIGI+RECO+ALCAELE.log  2>&1

cmsDriver.py MyGenSim/My53xProd/python/PythiaHadronizer_HToGG_M-125_cfi \
    --filein root://eoscms.cern.ch//eos/cms/store/cmst3/user/govoni/powheg/prodU04_125/pwgevents-0001.lhe \
    --filetype LHE \
    --conditions auto:startup \
    -s GEN,SIM,DIGI,L1 \
    --eventcontent AODSIM --datatier AODSIM \
    -n 2

## \
##    --no_exec

## ,DIGI,L1,DIGI2RAW,HLT,RAW2DIGI,L1Reco,RECO \

##    --filein filelist:$CMSSW_BASE/src/MyGenSim/My53xProd/data/MINLO_H125.txt \
