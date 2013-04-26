#!/bin/bash

makePset() {
    mass=$1
    cmsDriver.py MyGenSim/My53xProd/python/PythiaHadronizer_HToGG_cff \
	--filein MyGenSim/My53xProd/data/MINLO_H${mass}.txt \
	--filetype LHE \
	--conditions auto:startup \
	-s GEN,SIM,DIGI,L1,DIGI2RAW,RAW2DIGI,L1Reco,RECO \
	--eventcontent AODSIM --datatier AODSIM \
	--fileout GluGluToH2JetsHToGG_M-${mass}_8TeV-powheg-minlo-pythia6.root \
	--pileup 2012_Summer_50ns_PoissonOOTPU \
	--pileup_input MyGenSim/My53xProd/data/minbias.txt \
	--no_exec \
	--customise MyGenSim/My53xProd/customize_sources \
	--python_filename GluGluToH2JetsHToGG_M-${mass}_8TeV-powheg-minlo-pythia6.py \
	-n 2
}

##     --dump_python \


## for mass in $(seq 110 150 5); do
##     makePset $mass
## done

makePset 125
