use <../Assemblies/motor_and_wheel.scad>
use <../Reference Objects/gearmotor.scad>
use <../Utilities/triangle.scad>

$fn = 100;

brace_width = 180;
brace_length = 40;

frame_width = 40;
frame_length = 120;
frame_thickness = 6;
frame_offset_x = (brace_width - frame_width) / 2;
frame_motor_offset = 10;

top_frame_offset_y = (motorRadius() + frame_motor_offset) * 2 - frame_thickness;

//motorAssemblies();

//frame();

//translate([0, 0, top_frame_offset_y]) frame();

rotate([0,90,0])
scale([0.3,1,1]){
	motor_mount();
}
//translate([brace_width + frame_thickness, 0, 0]) motor_mount();

// tail

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

side_hole_radius = 13.2 / 2;
side_hole_distance = 14;
side_hole_spacing_radius = 31 / 2;

module motor_mount() {
	color("DarkBlue")
	translate([motorShaftLength() - frame_thickness, 0, 0]) {
		hole_offset = ((top_frame_offset_y + frame_thickness) / 2) - (side_hole_radius + 7);
		difference() {
			difference() {
				cube([frame_thickness, frame_width, top_frame_offset_y + frame_thickness]);
				translate([-1, brace_length / 2, (top_frame_offset_y + frame_thickness) / 2]) {
					rotate([0, 90, 0]) mounting_holes(1.75);
				}
			}
			translate([-1, brace_length/2 - side_hole_radius, hole_offset]) side_hole();
		}
	}
}

module side_hole() {	// meh
	translate([0, side_hole_radius, 14 + side_hole_radius])
	rotate([0, 90, 0])
	hull() {
		cylinder(r=side_hole_radius, h=frame_thickness + 2);
		translate([14, 0, 0]) cylinder(r=side_hole_radius, h=frame_thickness + 2);
	}
}

module motorAssemblies() {
	translate([0, brace_length / 2, motorRadius() * 2 + frame_motor_offset]){
		translate([brace_width + motorShaftLength() - motorLength(), 0, 0]){
			rotate([180,0,0]) motor_assembly();
		}
		translate([motorFullLength(), 0, 0]) {
			rotate([180, 0, 180]) motor_assembly();
		}
	}
}
