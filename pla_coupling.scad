holeX = 7.5;
holeY = 6.5;

holeR = 3.4 / 2;
nutR = 3.25;
nutH = 3;
corner_cut = 26;

studding_dia = 8.0;
shaft_dia = 6.5;

module coupling()
{

	translate([0,0,4])
	union()
	{
		difference()
		{
			cube(size = [30,25,8], center = true);
	
			*cube(size = [2,40,30], center = true);
                
			//nut holes
#			translate([ holeX, -holeY+1,- 4.01]) cylinder(h = nutH, r=nutR, $fn=6);
			translate([-holeX,  holeY,- 4.01]) cylinder(h = nutH, r=nutR, $fn=6);
			
			//shaft groves
			translate([ -16, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=studding_dia / 2, $fn=16);
			translate([-0.5, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=shaft_dia / 2,    $fn=16);
			
			//screw holes
			translate([ holeX,  holeY-1, -10]) cylinder(h = 20, r=holeR, $fn=16);
			translate([ holeX, -holeY++1, -4+nutH+0.4]) cylinder(h = 20, r=holeR, $fn=16);
			translate([-holeX,  holeY, -4+nutH+0.4]) cylinder(h = 20, r=holeR, $fn=16);
			translate([-holeX, -holeY, -10]) cylinder(h = 20, r=holeR, $fn=16);
			
			//corners
			rotate([0,0,30])   translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
			rotate([0,0,-30])  translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
			rotate([0,0,150])  translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
			rotate([0,0,-150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);


			
			translate([15-7,0,5])
			difference()
			{
			translate([5,0,0])
			cube([10,30,20],true);
			translate([-1,0,0])
			rotate([0,90,0])
			cylinder(r=24/2,h=8);
			}
		}
	}
}

coupling();
//for(i=[0:1])for(j=[0:1])translate([i*34, j*30, 0])coupling(c=1);
