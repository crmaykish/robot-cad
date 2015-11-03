axel_mount();

module axel_mount() {
	// motor mount
	difference() {
		cylinder(r=25.4/2, h=5);
		mounting_holes();
	}

	// offset
	translate([0,0,5]){
		cylinder(r=6, h=10);
	}

	// wheel adaptor
	translate([0,0,15]){
		difference(){
			difference() {
				cylinder(r=13.5/2, h=23);
				translate([13.5/2-2,-1,0])
					cube([2, 2, 23]);
			}
			translate([-13.5/2,-1,0])
				cube([2, 2, 23]);
		}
	}
}

module mounting_holes() {
	for (i = [0:5]){
		rotate([0,0,30 + 60 * i]) {
			translate([9.5,0,0]){
				cylinder(r=1.75, h=12);
			}
		}
	}
}