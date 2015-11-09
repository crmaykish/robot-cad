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

	// joystick mounts
	translate([0, case_length - 10, 0]){
		joystick_mount();
		translate([joystick_spacing, 0, 0]) joystick_mount();
	}

	// circuit board mount
	board_mount();
}

module board_mount() {
	board_spacing_x = 84.5;
	board_spacing_y = 46.5;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * board_spacing_x, j * board_spacing_y, 0]) standoff();
		}
	}
}

module joystick_mount() {
	joystick_spacing_x = 20;
	joystick_spacing_y = 20;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * joystick_spacing_x, j * joystick_spacing_y, 0]) standoff();
		}
	}
}