body_diameter = 11.25;
back_diameter = 10.4;
point_diameter = 4.1;

body_length = 90.25;
back_length = 14;
tip_length = 19;

refill_tip_diameter = 3.15;
refill_body_diameter = 5.25;
refill_body_length = 71.5;

level_of_detail = 100;

difference() {
    union() {
        hull() {
            translate([ 0, 0, back_length ]) cylinder(h = body_length - back_length, d = point_diameter, center = false, $fn=level_of_detail);
            translate([ 0, 0, back_length ]) cylinder(h = body_length - back_length - tip_length, d = body_diameter, center = false, $fn=level_of_detail);
        }
        cylinder(h = back_length, d = back_diameter, center = false, $fn=level_of_detail);
        cylinder(h = back_length, d = back_diameter, center = false, $fn=level_of_detail);
    };
    translate([ -10, 0, 1.4 + 2.65 ]) rotate([ 0, 90, 0 ]) cylinder(h = 20, d = 2.9, center = false, $fn=level_of_detail);
    cylinder(h = body_length, d = refill_tip_diameter, center = false, $fn=level_of_detail);
    cylinder(h = refill_body_length, d = refill_body_diameter, center = false, $fn=level_of_detail);
};