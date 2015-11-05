motor_mount_radius = 25.4 / 2;
motor_mount_height = 5;

offset_radius = 6;
offset_height = 10;

wheel_adaptor_radius = 13.5 / 2;
wheel_adaptor_height = 23;

slot_size = 2;

screw_hole_radius = 1.75;
screw_hole_offset = 9.5;

axel_mount();

module axel_mount() {
	color("Green")
	// motor mount
	difference() {
		cylinder(r=motor_mount_radius, h=motor_mount_height);
		mounting_holes();
	}

	// offset
	color("Green")
	translate([0, 0, motor_mount_height]){
		cylinder(r=offset_radius, h=offset_height);
	}

	// wheel adaptor
	color("Green")
	translate([0, 0, motor_mount_height + offset_height]){
		wheel_adaptor();
	}
}

module wheel_adaptor() {
	difference() {
		cylinder(r=wheel_adaptor_radius, h=wheel_adaptor_height);
		translate([wheel_adaptor_radius - slot_size, -slot_size / 2, 0])
			slot();
			translate([-wheel_adaptor_radius, -slot_size / 2, 0])
				slot();
	}
}

module mounting_holes() {
	for (i = [0:5]){
		rotate([0,0,30 + 60 * i]) {
			translate([screw_hole_offset, 0, 0]){
				cylinder(r=screw_hole_radius, h=wheel_adaptor_height);
			}
		}
	}
}

module slot() {
	cube([slot_size, slot_size, wheel_adaptor_height]);
}