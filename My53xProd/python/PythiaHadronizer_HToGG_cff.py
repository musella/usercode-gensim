import FWCore.ParameterSet.Config as cms

from Configuration.Generator.PythiaUEZ2starSettings_cfi import *

# Includes for Tauola
from GeneratorInterface.ExternalDecays.TauolaSettings_cff import *

generator = cms.EDFilter("Pythia6HadronizerFilter",
                         pythiaPylistVerbosity = cms.untracked.int32(1),
                         filterEfficiency = cms.untracked.double(1.0),
                         pythiaHepMCVerbosity = cms.untracked.bool(False),
                         comEnergy = cms.double(8000.0),
                         crossSection = cms.untracked.double(1.), 
                         maxEventsToPrint = cms.untracked.int32(5),
                         ExternalDecays = cms.PSet(Tauola = cms.untracked.PSet(TauolaPolar,
                                                                               InputCards = cms.PSet(pjak1 = cms.int32(0),
                                                                                                     pjak2 = cms.int32(0),
                                                                                                     mdtau = cms.int32(0)
                                                                                                     )
                                                                               ),
                                                   parameterSets = cms.vstring('Tauola')
                                                   ),
                         PythiaParameters = cms.PSet(pythiaUESettingsBlock,
                                                     processParameters = cms.vstring('MSEL=0           ! User defined processes',
                                                                                     'MSTJ(1)=1        ! Fragmentation/hadronization on or off',
                                                                                     'MSTP(61)=1       ! Parton showering on or off',
                                                                                     'MDME(210,1)=0    ! Higgs decay into dd',
                                                                                     'MDME(211,1)=0    ! Higgs decay into uu',
                                                                                     'MDME(212,1)=0    ! Higgs decay into ss',
                                                                                     'MDME(213,1)=0    ! Higgs decay into cc',
                                                                                     'MDME(214,1)=0    ! Higgs decay into bb',
                                                                                     'MDME(215,1)=0    ! Higgs decay into tt',
                                                                                     'MDME(216,1)=0    ! Higgs decay into bbbar prime',
                                                                                     'MDME(217,1)=0    ! Higgs decay into ttbar prime',
                                                                                     'MDME(218,1)=0    ! Higgs decay into e e',
                                                                                     'MDME(219,1)=0    ! Higgs decay into mu mu',
                                                                                     'MDME(220,1)=0    ! Higgs decay into tau tau',
                                                                                     'MDME(221,1)=0    ! Higgs decay into tau tau prime',
                                                                                     'MDME(222,1)=0    ! Higgs decay into g g',
                                                                                     'MDME(223,1)=1    ! Higgs decay into gam gam',
                                                                                     'MDME(224,1)=0    ! Higgs decay into gam Z',
                                                                                     'MDME(225,1)=0    ! Higgs decay into Z Z',
                                                                                     'MDME(226,1)=0    ! Higgs decay into W W',
                                                                                     ),
                                                     parameterSets = cms.vstring('pythiaUESettings',
                                                                                 'processParameters'
                                                                                 )
                                                     )
                         )


