mol load pdb 6b8h.pdb
set sel [as top "protein"]
## serials
set i [$sel get serial]
set j 1
## chains
set k 1 
set ii 0
foreach l $i {
set sel [as top "serial $l"]
set m  [$sel get chain]
if {$k ne $m} {
echo "chain changed to"
echo $m
echo "from"
echo $k
set n [expr $l - 1 ]
set k $m 
set prev [as top "serial $j to $n"]
$prev set segname A$ii
incr ii
set j $l
}
}
set all [as top "protein"]
$all writepdb new.pdb
quit
