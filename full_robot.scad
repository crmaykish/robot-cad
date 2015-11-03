use <gearmotor.scad>;
use <bottom_bracket.scad>;

$fn = 100;

bracket();

translate([56.5 + 6, 36.8 / 2 - (36.8/2 - 28 / 2), 36.8 + 6 + 4.71])
rotate([0,180,0]) gearmotor();


translate([182 - 56.5 + 6, 36.8 / 2 - (36.8/2 - 28 / 2), 36.8 + 6 + 4.71])
rotate([180,0,0]) gearmotor();