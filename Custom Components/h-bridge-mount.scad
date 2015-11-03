use <standoff.scad>

spacing = 37;

for (x = [0:1]){
	for (y = [0:1]){
		translate([x * spacing, y * spacing, 0])standoff();
	}
}