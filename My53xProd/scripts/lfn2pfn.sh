#!/bin/bash

site=$1 && shift 
file=$1 && shift
protocol=remote-xrootd
[[ -n $1 ]] && protocol=$1 && shift

wget --no-check-certificate -O- "http://cmsweb.cern.ch/phedex/datasvc/xml/prod/lfn2pfn?node=$site&protocol=$protocol&lfn=$dataset" 2>/dev/null | sed -e "s/.*pfn='\([^']*\).*/\1\n/"
