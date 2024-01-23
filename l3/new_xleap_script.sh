source leaprc.DNA.bsc1
source leaprc.RNA.OL3
source leaprc.protein.ff14SB

#loadoff /home/test/miniconda3/envs/AmberTools22/dat/leap/lib/parmBSC1.cufix.lib
#cufix = loadamberparams frcmod.ff99cufix
source leaprc.water.tip3p

loadoff new.lib

#addions dna Na+ 0
#addions dna Cl- 90
#addions dna Na+ 0

#solvatebox dna TIP3PBOX 7
#savepdb dna dna_prot.pdb
#saveamberparm dna  dna_pot_WI.prmtop dna_pot_WI.rst7
#quit
