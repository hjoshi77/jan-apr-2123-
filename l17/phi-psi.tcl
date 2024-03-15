mol new new.pdb
set fp [open "phi-psi.txt" w+]
set sel [as top "protein"]
set i 0
set chains [lsort -unique [$sel get segname] ]
foreach l $chains {
set numResidues [ [atomselect top "protein and name N and segname $l"] num]
incr i
puts $fp "# res-id, Phi, Psi chain"

for {set i 2} {$i < $numResidues } {incr i} {
	set j [expr $i + 1]
	set k [expr $i - 1]
	set phi [measure dihed [ [as top "((resid $k and name C) or (resid $i and name N CA C)) and segname $l"] get index] ] 
	set psi [measure dihed [ [as top "((resid $i and name N CA C) or (resid $j and name N)) and segname $l"] get index] ] 

puts $fp "$i $phi $psi $l"
  
 }
}
close $fp
quit
