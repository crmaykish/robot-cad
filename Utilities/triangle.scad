triangle();

module triangle(l = 20, w = 20, h = 20) {
	scale([l, w, h]) {
		difference(){
			cube([1, 1, 1]);
			translate([0, 0, -0.5]) rotate([0,0,45]) cube([2, 2, 2]);
		}
	}
}