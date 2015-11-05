use <../Reference Objects/gearmotor.scad>
use <../Reference Objects/l-bracket.scad>
use <../Reference Objects/shaft_mounting_hub.scad>
use <../Reference Objects/wheel.scad>
use <../Reference Objects/m3.scad>
use <../Custom Components/axel_mount.scad>

motor_assembly();

module motor_assembly() {
	gearmotor();

	translate([motorFullLength(), 0, hubLargeRadius() - 1])	// bad
		rotate([0,270,0]) shaft_mounting_hub();

	translate([motorFullLength(), 0, hubLargeRadius() - 1]) rotate([0,90,0]) axel_mount();

	translate([motorFullLength() - 5, 0, 11.7]){	// bad
		rotate([0,90,0]){
		for (i = [0:5]){
				rotate([0, 0, 30 + 60 * i]) {
					translate([9.5, 0, 0]){
						m3bolt(10);
					}
				}
			}
		}
	}

	translate([motorFullLength() + 15, 0, 11.5])	// not exact
		rotate([0,90,0])
			wheel();
}