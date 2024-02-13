mol new ../na_WI.prmtop
mol addfile md_img.dcd waitfor all

set num_frames [molinfo top get numframes]

# Open a file to store the end-to-end distances over time
set outfile [open "end_to_end_distance.dat" "w"]

# Iterate over each frame
for {set frame 0} {$frame < $num_frames} {incr frame} {
    # Load the frame
    animate goto $frame

    # Initialize variables to store the sum and count
if {1} {
    set sum_distance 0.0
    set count 0

    # Iterate over each base pair
    for {set resid 1} {$resid < 20} {incr resid} {
	set cresid [expr 43 - $resid]
	set hresid [expr $resid +1]
	set chresid [expr 43 - $hresid]
        set t1 [atomselect 0 "resid $resid or resid $cresid"]
        set t2 [atomselect 0 "resid $hresid or resid $chresid"]
        set c1 [measure center $t1]
        set c2 [measure center $t2]
        set distance [vecdist $c1 $c2]

        # Add the distance to the sum
        set sum_distance [expr $sum_distance + $distance]

        # Increment the count
        incr count
    }

    # Calculate the average end-to-end distance for this frame
    set e2e_distance [expr {$sum_distance / $count}]

        set t1 [atomselect 0 "resid 1 or resid 42"]
        set t2 [atomselect 0 "resid 21 or resid 22"]
        set c1 [measure center $t1]
        set c2 [measure center $t2]
        set distance [vecdist $c1 $c2]
	 
    
    # Output the average end-to-end distance for this frame
    puts $outfile "$frame $sum_distance $distance"
}
}
quit

