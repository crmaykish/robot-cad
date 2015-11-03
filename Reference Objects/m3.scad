m3bolt(10);

module m3bolt(length) {
	cylinder(r=1.5, h=length);
	translate([0,0,length]){
		cylinder(r=5.5/2, h=3);
	}
}