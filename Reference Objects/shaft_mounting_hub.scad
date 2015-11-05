function hubLargeRadius() = 25.4 / 2;
large_height = 5;
small_radius = 6;
small_height = 4.2;
inner_radius = 3;
mounting_hole_radius = 1.5;
mounting_hole_spacing = 9.5;

shaft_mounting_hub();

module shaft_mounting_hub() {
	color("Silver")
	difference() {
		difference() {
			union() {
				cylinder(r=hubLargeRadius(), h=large_height);
				translate([0,0,large_height]) {
					cylinder(r=small_radius, h=small_height);
				}
			}
			cylinder(r=inner_radius, h=small_height + large_height);
		}
		mounting_holes();
	}
}

module mounting_holes() {
	for (i = [0:5]){
		rotate([0, 0, 30 + 60 * i]) {
			translate([mounting_hole_spacing, 0, 0]){
				cylinder(r=1.5, h=12);
			}
		}
	}
}