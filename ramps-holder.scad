// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20
 * @using 1 m3nut
 * @using 2 m3washer
 */
module endstop(hole_offset=0,endstop_width=10){
	outer_diameter= m8_diameter+3.3*2;
	screw_hole_spacing=48.26;
	opening_size = m8_diameter-1.5; //openingsize
	
	difference()
	{
		union()
		{
			translate([outer_diameter/2, outer_diameter/2, 0]) 
			cylinder(h=endstop_width, r = outer_diameter/2, $fn = 20);
			translate([outer_diameter/2, 0, 0]) 
			cube([15.5,outer_diameter,endstop_width]);
			translate([-(screw_hole_spacing+8), 0, 0]) 
			cube([screw_hole_spacing+8+10, 4, endstop_width]);
		}
	
		translate([9, outer_diameter/2-opening_size/2,-1]) 
		cube([18,opening_size,endstop_width+2]);
		translate([outer_diameter/2, outer_diameter/2, -1]) 
		cylinder(h=endstop_width+2, r = m8_diameter/2, $fn = 18);

		translate([17, outer_diameter+1, endstop_width/2]) rotate([90, 0, 0]) 
		cylinder(h=outer_diameter+2, r = m3_diameter/2, $fn = 10);

		for(hole=[-1,1])
		translate([-4-screw_hole_spacing/2-screw_hole_spacing/2*hole,
			outer_diameter+1,endstop_width/2+hole*hole_offset/2]) 
		rotate([90, 0, 0]) 
		cylinder(h=outer_diameter+2, r = m3_diameter/2, $fn = 10);
	}
}

endstop(hole_offset=0,endstop_width=10);
translate([0,20,0])
endstop(hole_offset=6.35,endstop_width=14);
