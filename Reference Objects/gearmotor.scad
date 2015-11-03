// 37D x 57L Gearmotor

$fn=100;

motorLength = 56.5;
motorRadius = 36.8 / 2;

gearmotor();

module gearmotor() {
	translate([0,0,motorRadius]){
		rotate([0,90,0]){
			difference() {
				// motor body
				color("Grey")
				cylinder(r=motorRadius, h=motorLength);
				// mounting holes
				translate([0,0,motorLength-10]) mounting_holes();
			}
			// drive shaft
			translate([7,0,motorLength]) drive_shaft();
		}
	}
}

module mounting_holes() {
	color("DarkGrey")
	for (i = [0:5]){
		rotate([0,0,30 + 60 * i]) {
			translate([15.5,0,0]){
				cylinder(r=1.5, h=12);
			}
		}
	}
}

module drive_shaft() {
	color("Silver")
	cylinder(r=6, h=6.5);
	translate([0,0,6.5]){
		color("Silver")
		cylinder(r=3, h=15.5);
	}
}