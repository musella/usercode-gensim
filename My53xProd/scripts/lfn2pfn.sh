#!/bin/bash

site=$1 && shift 
file=$1 && shift
protocol=remote-xrootd
[[ -n $1 ]] && protocol=$1 && shift

wget --no-check-certificate -O- "http://cmsweb.cern.ch/phedex/datasvc/xml/prod/lfn2pfn?node=T2_DE_DESY&protocol=remote-xrootd&lfn=/store/mc/Summer12/MinBias_TuneZ2star_8TeV-pythia6/AODSIM/NoPileUp_START50_V15-v1/0000/F6CA28C5-1670-E111-B8E7-0030487FA627.root" 2>/dev/null | sed -e "s/.*pfn='\([^']*\).*/\1\n/"
