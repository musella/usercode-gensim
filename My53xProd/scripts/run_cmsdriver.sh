#!/bin/bash

export PYTHONPATH=${PWD}:${PYTHONPATH}

mkMultiCrab() {
    dsetName=$1 && shift
    version=$1 && shift
cat >> multicrab.cfg <<EOF
[$dsetName-v${version}]
CMSSW.pset=${dsetName}.py
USER.publish_data_name=${dsetName}-v${version}
EOF
}

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
	--customise customize_sources.py \
	--python_filename GluGluToH2JetsHToGG_M-${mass}_8TeV-powheg-minlo-pythia6.py \
	-n 2
}

makePsetRD() {
    mass=$1
    gt=START53_V7L
    outname=GluGluToH2JetsHToGG_M-${mass}_8TeV-powheg-minlo-pythia6-${gt}_PhRdPu
    cmsDriver.py MyGenSim/My53xProd/python/PythiaHadronizer_HToGG_cff \
	--filein MyGenSim/My53xProd/data/MINLO_H${mass}.txt \
	--filetype LHE \
	--conditions ${gt}::All \
	-s GEN,SIM,DIGI,L1,DIGI2RAW,RAW2DIGI,L1Reco,RECO \
	--eventcontent AODSIM --datatier AODSIM \
	--fileout ${outname}.root\
	--pileup fromDB \
	--pileup_input dbs:/MinBias_TuneZ2star_8TeV-pythia6/Summer12-START50_V13-v3/GEN-SIM \
	--no_exec \
	--customise customize_sources.py \
	--python_filename ${outname}.py \
	--runsScenarioForMC Run2012_AB_C_D_oneRunPerEra \
	-n 2
    
    mkMultiCrab $outname 1
}

##     --dump_python

rm multicrab.cfg

## for mass in $(seq 110 150 5); do
##     makePset $mass
## done

makePsetRD 125
