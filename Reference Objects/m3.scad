$fn=100;
m3bolt(10);
m3washer();

module m3bolt(length) {
	color("DarkSlateGrey"){
		cylinder(r=1.5, h=length);
		translate([0,0,length]){
			cylinder(r=5.5/2, h=3);
		}
	}
}

module m3washer() {
	color("Silver")
	difference() {
		cylinder(r=7/2, h=0.5);
		cylinder(r=3.2/2, h=0.5);
	}
}