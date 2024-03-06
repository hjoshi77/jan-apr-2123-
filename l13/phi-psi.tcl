mol new 1ubq.pdb
set numResidues 75
set fp [open "phi-psi.txt" w+]

puts $fp "# res-id, Phi, Psi"
echo "Hi"
for {set num 1} {$num < $numResidues} {incr num} {
set c1 [atomselect top "residue $num and  name C"]
set c2 [atomselect top "residue $num  and name N"]
set c3 [atomselect top "residue $num  and name CA"]
set c4 [atomselect top "residue [expr {$num + 1}] and name C"]
set c5 [atomselect top "residue [expr {$num + 1}] and name N"]


set v1 [vecsub [measure center $c1] [measure center $c2] ]
set v2 [vecsub [measure center $c2] [measure center $c3] ]
set v3 [vecsub [measure center $c3] [measure center $c4] ]
set v4 [vecsub [measure center $c4] [measure center $c1] ]


set v_1 [veccross $v1 $v2]
set v_2 [veccross $v3 $v4]


set n [ expr [vecdot $v_1 $v_2]]
set d [expr [veclength $v_1]  * [veclength $v_2 ]]
set x [expr ($n/ $d)]
set phi  [expr acos($x) *(180)*7/22 ]



set s1 [vecsub [measure center $c2] [measure center $c3]]
set s2 [vecsub [measure center $c3] [measure center $c4]]
set s3 [vecsub [measure center $c4] [measure center $c5]]
set s4 [vecsub [measure center $c5] [measure center $c2]]


set s_1 [veccross $s1 $s2]
set s_2 [veccross $s3 $s4]


set n1 [ expr [vecdot $s_1 $s_2]]
set d1 [expr [veclength $s_1]  * [veclength $s_2 ]]
set x1 [expr ($n1/ $d1)]
set psi  [expr acos($x1) *(180)*7/22 ]


puts $fp "$num $phi $psi"
  
 
 }
close $fp
quit
