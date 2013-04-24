#!/bin/bash

cmsDriver.py MyGenSim/My53xProd/python/PythiaHadronizer_HToGG_M-125_cff \
    --filein filelist:$CMSSW_BASE/src/MyGenSim/My53xProd/data/MINLO_H125.txt \
    --filetype LHE \
    --conditions auto:startup \
    -s GEN,SIM,DIGI,L1,DIGI2RAW,RAW2DIGI,L1Reco,RECO \
    --eventcontent AODSIM --datatier AODSIM \
    --fileout GluGluToH2JetsHToGG-M-125_8TeV-powheg-minlo-pythia6.root \
    --no_exec \
    -n 2
