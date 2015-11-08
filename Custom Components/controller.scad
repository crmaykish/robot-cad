use <../Custom Components/standoff.scad>
use <../Custom Components/arduino_mount.scad>

case_width = 140;
case_length = 90;
case_height = 24;
case_thickness = 2;
joystick_spacing = 90;


// case
translate([10,10,0]){
	minkowski() {
		cube([case_width, case_length, case_thickness / 2]);
		cylinder(r=10, h=case_thickness / 2);
	}
}



translate([0, 0, case_thickness]){

	translate([case_width - 40, 10, 0]) arduino_mount();

	translate([0, case_length - 10, 0]){
		joystick_mount();
		translate([joystick_spacing, 0, 0]) joystick_mount();
	}
}

module joystick_mount() {
	spacing_x = 20;
	spacing_y = 20;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * spacing_x, j * spacing_y, 0]) standoff();
		}
	}
}