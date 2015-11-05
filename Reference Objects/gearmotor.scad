// 37D x 57L Gearmotor
function motorLength() = 56.5;
function motorRadius() = 36.8 / 2;
function motorFullLength() = motorLength() + 15.5 + 6.5;
function motorShaftLength() = 15.5 + 6.5;

gearmotor();

module gearmotor() {
	translate([0, 0, motorRadius()]){
		rotate([0, 90, 0]){
			difference() {
				// motor body
				color("Grey")
				cylinder(r=motorRadius(), h=motorLength());
				// mounting holes
				translate([0, 0, motorLength()-10]) mounting_holes();
			}
			// drive shaft
			translate([7, 0, motorLength()]) drive_shaft();
		}
	}
}

module mounting_holes(hole_radius = 1.5) {
	color("DarkGrey")
	for (i = [0:5]){
		rotate([0, 0, 30 + 60 * i]) {
			translate([15.5, 0, 0]){
				cylinder(r=hole_radius, h=12);
			}
		}
	}
}

module drive_shaft() {
	color("Silver")
	cylinder(r=6, h=6.5);
	translate([0, 0, 6.5]){
		color("Silver")

		difference(){
			cylinder(r=3, h=15.5);
			translate([-3, -4, 3.5])
				cube([0.6, 8, 13]);
		}	
	}
}