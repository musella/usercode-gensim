usercode-gensim
===============

* Notes:
  * cmsDriver commands  
    runTheMatrix.py -l 29 --dryRun  
    runTheMatrix.py --help  
    runTheMatrix.py -n
  * Min-bias samples for pileup  
  cd My53xProd/scripts/  
  wget --no-check-certificate -O das_cli.py 'https://cmsweb.cern.ch/das/cli'  
  ./das_cli.py --query='file dataset=/MinBias_TuneZ2star_8TeV-pythia6/Summer12-NoPileUp_START50_V15-v1/GEN-SIM-RECO' --limit=10000 | xargs -n 1 ./lfn2pfn.sh <MINB_GRID_SITE> > minbias.txt  
  * CRAB bug when running on CAF
  storage_element=caf.cern.ch
  return_data=0
  user_remote_dir=store/cmst3/user
  storage_path=root://eoscms//eos/cms

  sed 's%\tstore%\t/store%' -i GluGluToH2JetsHToGG_M-125_8TeV-powheg-minlo-pythia6-v1/res/crab_fjr_*.xml


