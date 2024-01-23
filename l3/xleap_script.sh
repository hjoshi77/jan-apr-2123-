source leaprc.DNA.bsc1
source leaprc.RNA.OL3
source leaprc.protein.ff14SB

source leaprc.water.tip3p

a = loadpdb dodecamer.pdb
addions a MG 0
addions a Na+ 14 
addions a Cl- 0

solvatebox a TIP3PBOX 6
savepdb a nuc_prot.pdb
saveamberparm a  nuc_pot_WI.prmtop nuc_pot_WI.rst7
quit
