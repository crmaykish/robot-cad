mount_width = 30;
mount_thickness = 6;
mount_hole_radius = 1.75;
mount_hole_spacing = 24;
mounting_holes_offset = (mount_width - mount_hole_spacing) / 2;

tail_length = 90;
tail_width = 15;
tail_offset = tail_width / 2;

tail();

module tail(){
	tail_mount();

	translate([tail_offset, tail_offset, mount_thickness]) {
		cube([tail_width, tail_width, tail_length]);
	}

}

module tail_mount() {
	difference() {
		cube([mount_width, mount_width, mount_thickness]);
		translate([mounting_holes_offset, mounting_holes_offset, 0]) mounting_holes();
	}
}

module mounting_holes() {
	for (i = [0:1]){
		for (j = [0:1]){
			translate([mount_hole_spacing * i, mount_hole_spacing * j, 0]) {
				cylinder(r=mount_hole_radius, h=mount_thickness);
			}
		}
	}
}