mol new ubq_wb.psf
mol addfile ubq_wb_eq.dcd waitfor all
set fp [open "phi-psi.txt" w+]
set numResidues [ [atomselect top "protein and name N "] num]
puts $fp "# res-id, Phi, Psi"

set n [molinfo 0 get numframes] 
echo $n
for {set l 0} {$l < $n} {incr l} {
echo $l
animate goto $l
echo "Hi"
if {1} {
for {set i 2} {$i < $numResidues } {incr i} {
	set j [expr $i + 1]
	set k [expr $i - 1]

	set phi [measure dihed [ [as top "resid $k and name C or (resid $i and name N CA C)"] get index] ] 
	set psi [measure dihed [ [as top "(resid $i and name N CA C) or (resid $j and name N)"] get index] ] 

puts $fp "$i $phi $psi"
  
 }
}
 }
close $fp
quit
