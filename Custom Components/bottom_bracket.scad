length = 194;
height = 22;
width = 28;
thickness = 6;
hole_radius = 1.75;

bracket();

module bracket(){
	color("White")
	difference() {
		// bracket
		union(){
			cube([length, width, thickness]);
			translate([0, 0, thickness]){
				coords = [thickness, width, height - thickness];
				cube(coords);
				translate([length - thickness, 0, 0]){
					cube(coords);
				}
			}
		}

		// screw holes
		translate([-5, width / 2 - 8, 15.5]){
			rotate([0,90,0]){
				cylinder(r=hole_radius, h=length + 10);
				translate([0,15.5,0]){
					cylinder(r=hole_radius, h=length + 10);
				}
			}
		}
	}
}

