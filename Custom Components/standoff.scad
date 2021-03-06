standoff_default_height = 4;
standoff_outer_radius = 3;
standoff_inner_radius = 1.75;	// hole on board is 1.6mm, 1.75 gives room for the bolts
standoff_extra_hole_depth = 5;

standoff();

module standoff(standoff_height = standoff_default_height) {
	difference() {
		cylinder(r=standoff_outer_radius, h=standoff_height);
		translate([0, 0, -standoff_extra_hole_depth]) cylinder(r=standoff_inner_radius, h=standoff_height + standoff_extra_hole_depth);
	}
}