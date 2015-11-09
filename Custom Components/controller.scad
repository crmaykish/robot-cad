use <../Custom Components/arduino_mount.scad>
use <../Custom Components/standoff.scad>

$fn = 30;

case_width = 140;
case_length = 90;
case_height = 24;
case_thickness = 2;
joystick_spacing = 90;

// case
difference() {
	case();
	union() {
		translate([case_width / 2 - 46.5/2 + 10, 10, 0]) {
			board_mount_holes();
		}

		translate([10, case_length - 20, 0]) {
			joystick_mount_holes();
			translate([case_width - 10 - 10, 0, 0]) joystick_mount_holes();
		}

		translate([case_width / 2 + 10 - 35, 22, 0]) {
			minkowski() {
				cube([70, 60, 10]);
				cylinder(r=5, h=10);
			}
		}

	}
}

translate([0, 0, case_thickness]){
	translate([case_width / 2 - 46.5/2 + 10, 10, 0]) {
		board_mount();
	}

	translate([10, case_length - 20, 0]) {
		joystick_mount();
		translate([case_width - 10 - 10, 0, 0]) joystick_mount();
	}

}




module case() {
	translate([10,10,0]){
		minkowski() {
			cube([case_width, case_length, case_thickness / 2]);
			cylinder(r=10, h=case_thickness / 2);
		}
	}
}

module board_mount_holes() {
	board_spacing_y = 84.5;
	board_spacing_x = 46.5;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * board_spacing_x, j * board_spacing_y, -case_thickness]) cylinder(r=1.75, h=10);
		}
	}
}

module board_mount() {
	board_spacing_y = 84.5;
	board_spacing_x = 46.5;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * board_spacing_x, j * board_spacing_y, 0]) standoff();
		}
	}
}

module joystick_mount() {
	joystick_spacing_x = 20;
	joystick_spacing_y = 26;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * joystick_spacing_x, j * joystick_spacing_y, 0]) standoff();
		}
	}
}

module joystick_mount_holes() {
	joystick_spacing_x = 20;
	joystick_spacing_y = 26;

	for (i = [0:1]){
		for (j = [0:1]){
			translate([i * joystick_spacing_x, j * joystick_spacing_y, -case_thickness]) cylinder(r=1.75, h=10);
		}
	}
}