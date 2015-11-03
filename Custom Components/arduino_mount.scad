standoff_height = 6;
standoff_outer_radius = 3;
standoff_inner_radius = 1.75;	// hole on board is 1.6mm, 1.75 gives room for the bolts

edge_spacing = 2.5;
top_left_x_offset = 1.3;
top_left_y_offset = 53.3 - 2 * edge_spacing;
right_offset_x = 50.8 + 1.3;
right_offset_y = 5.1;
right_spacing = 27.9;

arduino_mount();

module arduino_mount(){
	standoff();	// bottom left

	translate([top_left_x_offset, top_left_y_offset, 0]){
		standoff();	// top left
	}

	translate([right_offset_x, right_offset_y, 0]){
		standoff();	// bottom right

		translate([0, right_spacing, 0]){
			standoff();	// top right
		}
	}
}

module standoff() {
	difference() {
		cylinder(r=standoff_outer_radius, h=standoff_height);
		cylinder(r=standoff_inner_radius, h=standoff_height);
	}
}