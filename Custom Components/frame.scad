use <../Assemblies/motor_and_wheel.scad>
use <../Reference Objects/gearmotor.scad>
use <../Utilities/triangle.scad>

brace_width = 180;
brace_length = 40;

frame_width = 40;
frame_length = 120;
frame_thickness = 6;
frame_offset_x = (brace_width - frame_width) / 2;

motorAssemblies();
frame();

module frame(){
	color("Green")
	translate([motorShaftLength(), 0, 0]) {
		// motor brace
		cube([brace_width, brace_length, frame_thickness]);

		translate([0,brace_length,0]) {

			// frame
			translate([frame_offset_x, 0, 0]) {
				cube([frame_width, frame_length, frame_thickness]);
			}

			// left triangle
			triangle(frame_offset_x, frame_length, frame_thickness);

			// right triangle
			translate([2*frame_offset_x + frame_width, 0, 0]) mirror([1, 0, 0]) triangle(frame_offset_x, frame_length, frame_thickness);

		}
	}
}

module motorAssemblies() {
	translate([0, brace_length / 2, motorRadius() * 2 + 10]){
		translate([brace_width + motorShaftLength() - motorLength(), 0, 0]){
			rotate([180,0,0]) motor_assembly();
		}
		translate([motorFullLength(), 0, 0]) {
			rotate([180, 0, 180]) motor_assembly();
		}
	}
}
