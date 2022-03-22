// This is not very readable, sorry, it was my first time in OpenSCAD. I hope to redo this better.

display_width = 11;
display_height = 35.1;
display_thickness = 0.741;
display_tolerance_horiz = 0.5;
display_tolerance_vert = 0.11 + 0.11; // extra 0.1 mm for tape

display_active_width = 6.004 + 1;
display_active_height = 29.072 + 1;

board_width = 12;
board_height = 52.6;
board_thickness = 1.6;
board_tolerance_horiz = 0.2;
board_tolerance_vert = 0.11;

button_width = 4.6;
button_height = 2.8;
button_thickness = 1.9;// + 10;
button_tolerance_horiz = 0.5;
button_tolerance_vert = 0.2;

reset_button_width = 4.7;
reset_button_height = 3.5;
reset_button_thickness = 1.35;
reset_button_tolerance_horiz = 0.5;
reset_button_tolerance_vert = 0.1;

usb_port_height = 7.35 + 0.2 + 6 + 0.2;
usb_port_width = 8.94 - 1.4;
usb_port_thickness = 3.16 + 0.2;

battery_diameter = 9.5 + 0.5;
battery_thickness = 2.7;

pen_diameter = 13;

level_of_detail = 100;

union() {
    // use one of these two lines for either the top or bottom part
    difference() {
//    intersection() {
        difference() {
            difference() {
                hull() {
                    // the bottom part
                    translate([ 0, 0, 0 ]) rotate([ 90, 0, 0 ]) cylinder(h = 15, d = pen_diameter, center = false, $fn=level_of_detail);
                    // the top part
                    translate([ 0, 0, 0 ]) rotate([ -90, 0, 0 ]) cylinder(h = 56 + 1, r = pen_diameter / 2 + 1, center = false, $fn=level_of_detail);
                }
                // carve out back part
                difference() {
                    translate([ 0, 0, 0 ]) rotate([ -90, 0, 0 ]) cylinder(h = 55.5, r = pen_diameter / 2 - 1, center = false, $fn=level_of_detail);
                    translate([ -10, 0, 0 ]) cube([ 20, 60, 10 ]);
                }
            };
            
            // remove top of cylinder
            translate([ -10, 0, 2.6 ]) cube([ 20, 60, 10 ]);
                
            // carve out hole for pen
            translate([ 0, -0.75, 0 ]) rotate([ 90, 0, 0 ]) cylinder(h = 50, r = 10.75 / 2, center = false, $fn=level_of_detail);
            
            // hole for screw
            translate([ 0, -11.6+6.25, -50 ]) cylinder(h = 100, d = 2.9, center = false, $fn=level_of_detail);
            
            // screw countersink
            translate([ 0, -11.6+6.25, 6 ])cylinder(h = 2, d = 5, center = false, $fn=level_of_detail);
            // nut countersink
            translate([ 0, -11.6+6.25, -8 ]) cylinder(h = 2, d = 6, center = false, $fn=6);

            translate([ 0, 2, 1 ]) union() {
                // the PCB
                translate( [0, (board_height + board_tolerance_horiz) / 2, (board_thickness + board_tolerance_vert) / -2] ) cube([board_width + board_tolerance_horiz, board_height + board_tolerance_horiz, board_thickness + board_tolerance_vert], center=true);

                // the display
                translate( [0, (display_height + display_tolerance_horiz) / 2, (display_thickness + display_tolerance_vert) / 2] ) cube([display_width + display_tolerance_horiz, display_height + display_tolerance_horiz, display_thickness + display_tolerance_vert], center=true);
                
                // the display cable carveout
                translate( [0, 0, (display_thickness + display_tolerance_vert - board_thickness - board_tolerance_vert) / 2] ) cube([board_width + board_tolerance_horiz, 2, display_thickness + display_tolerance_vert + board_thickness + board_tolerance_vert], center=true);
                // the display's active area
                difference() {
                    hull() {
                        translate( [-0.25, (display_height + display_tolerance_horiz) / 2 + 1.6, 0.5 + (display_thickness + display_tolerance_vert) / 2] ) cube([display_active_width, display_active_height,1], center=true);
                        translate( [-0.25, (display_height + display_tolerance_horiz) / 2 + 1.4, 10 + (display_thickness + display_tolerance_vert) / 2] ) cube([display_active_width + 20, display_active_height + 20,1], center=true);
                    };
                    translate([0, -5, 0]) cube([ 20, 10, 20 ], center=true);
                }

                // the Molex connector and battery cutout
                translate( [0, 10.5, -3] ) cube([10, 25, 5], center=true);

                // the passives at the edge
                translate( [0, 36, -2] ) cube([12.2, 24, 2], center=true);

                // the three main buttons
                translate( [0, board_height - 14.5, (button_thickness + button_tolerance_vert) / 2] ) cube([button_width + button_tolerance_horiz, button_height + button_tolerance_horiz, button_thickness + button_tolerance_vert], center=true);
                translate( [0, board_height - 10.5, (button_thickness + button_tolerance_vert) / 2] ) cube([button_width + button_tolerance_horiz, button_height + button_tolerance_horiz, button_thickness + button_tolerance_vert], center=true);
                translate( [0, board_height - 6.5, (button_thickness + button_tolerance_vert) / 2] ) cube([button_width + button_tolerance_horiz, button_height + button_tolerance_horiz, button_thickness + button_tolerance_vert], center=true);

                // the reset button
                translate( [0, board_height - 2, (reset_button_thickness + reset_button_tolerance_vert) / 2] ) cube([reset_button_width + reset_button_tolerance_horiz, reset_button_height + reset_button_tolerance_horiz, reset_button_thickness + reset_button_tolerance_vert], center=true);

                // the usb port
                translate([ 0, 3 + board_height + 1.67, -board_thickness - usb_port_thickness / 2 ]) rotate([ 90, 0, 0 ]) hull() {
                    translate([ (usb_port_width - usb_port_thickness / 2) / 2, 0, 0 ]) cylinder(h = usb_port_height, r = usb_port_thickness / 2, center = false, $fn=level_of_detail);
                    translate([ (usb_port_width - usb_port_thickness / 2) / -2, 0, 0 ]) cylinder(h = usb_port_height, r = usb_port_thickness / 2, center = false, $fn=level_of_detail);
                }
                
                // the battery
//                translate([ board_width / -2 + battery_diameter / 2, battery_diameter / 2, -board_thickness - battery_thickness ]) cylinder(h = battery_thickness, r = battery_diameter / 2, center=false, $fn = level_of_detail);
            };
        };

        // carve out top half
        translate([ -10, 0, 0 ]) cube([ 20, 60, 10 ]);
    };
};