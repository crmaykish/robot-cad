use <../Custom Components/axel_mount.scad>

wheel_radius = 165 / 2;
wheel_thickness = 34;

wheel();

module wheel(){
	color("White")
	difference() {
		cylinder(r=wheel_radius, h=wheel_thickness);
		union(){
			wheel_adaptor();
			translate([0,0,23]) wheel_adaptor();
		}
	}
}