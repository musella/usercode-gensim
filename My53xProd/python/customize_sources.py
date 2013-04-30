import FWCore.ParameterSet.Config as cms

from os.path import exists, join, abspath
from os import pathsep, environ
from string import split

def search_file(filename, search_path):
    """Given a search path, find file.
    """
    file_found = False
    paths = ["."]+split(search_path, pathsep)
    for path in paths:
        if exists(join(path, filename)):
            file_found = True
            break
    if file_found:
        return abspath(join(path, filename))
    else:
        return None
    
def replaceInputs(source):
    """Replace source.fileNames = vstring('<filename>.txt') with the file content.
    """
    fileNames = source.fileNames.value()
    if len(fileNames) == 1 and fileNames[0].endswith('.txt'):
        fnames = open(search_file(fileNames[0],environ['CMSSW_SEARCH_PATH']),'r')
        source.fileNames = cms.untracked.vstring([f for f in fnames.read().split('\n') if f != '' ])
        fnames.close()
    
    
def customise(process):

    if hasattr(process,'mix'):
        replaceInputs(process.mix.input)
        
    replaceInputs(process.source)
    
    return process
