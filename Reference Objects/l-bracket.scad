width = 37.6;
thickness = 2;
mounting_hole_radius = 3.2 / 2;

bottom_length = 49.2;
side_hole_radius = 13.2 / 2;
side_hole_distance = 14;
side_hole_spacing_radius = 31 / 2;

bottom_hole_spacing_x = 6.4;
bottom_hole_spacing_y = 31.2;
bottom_hole_offset_x = 6.4;	// misprint?
bottom_hole_offset_y = (width - bottom_hole_spacing_y) / 2;

bracket();

module bracket(){
	difference() {
		side();
		translate([0, width / 2 - side_hole_radius, width / 2 - side_hole_distance / 2]) side_hole();
	}

	translate([thickness, 0, 0]) bottom();
}

module side() {
	difference() {
		union(){
			cube([thickness, width, width / 2 + thickness]);
			translate([0, width / 2, width / 2]){
				rotate([0, 90, 0]){
					cylinder(r = width / 2, h = thickness);
				}
			}
		}
		side_mounting_holes();
	}
}

module bottom() {
	difference() {
		cube([bottom_length, width, thickness]);
		translate([bottom_hole_offset_x, bottom_hole_offset_y, 0]) bottom_mounting_holes();
	}	
}

module bottom_mounting_holes(){
	for (i = [0:6]){
		translate([i * bottom_hole_spacing_x, 0, 0]){
			cylinder(r=mounting_hole_radius, h=thickness + 1);
			translate([0, bottom_hole_spacing_y, 0]){
				cylinder(r=mounting_hole_radius, h=thickness + 1);
			}
		}
	}
}

module side_mounting_holes() {
	translate([0, width / 2, width / 2 + thickness - mounting_hole_radius]){
		for (i = [0:5]){
			rotate([60 * i, 0, 0]) {
				translate([0, side_hole_spacing_radius, 0]){
					rotate([0,90,0]){
						cylinder(r=mounting_hole_radius, h=thickness+4);
					}
				}
			}
		}
	}
}

module side_hole() {
	cube([thickness + 1, side_hole_radius * 2, side_hole_distance]);

	translate([0, side_hole_radius, 0]){
		rotate([0, 90, 0]){
			cylinder(r=side_hole_radius, h=thickness + 1);
		}
		translate([0, 0, side_hole_distance]){
			rotate([0, 90, 0]){
				cylinder(r=side_hole_radius, h=thickness + 1);
			}
		}
	}
}