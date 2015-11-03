use <standoff.scad>

edge_spacing = 2.5;
top_left_x_offset = 1.3;
top_left_y_offset = 53.3 - 2 * edge_spacing;
right_offset_x = 50.8 + 1.3;
right_offset_y = 5.1;
right_spacing = 27.9;

//arduino_mount();

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

