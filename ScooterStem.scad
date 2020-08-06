$fn=360;
/*
intersection() {
    difference(){
        cube([65,65,5], center=true);
        resize([55,61,6]) {
            cylinder(6,30.5,30.5, center=true);
        }
    }
    translate([0,16,0]){cube([67,32,6], center=true);}
}
*/

module stem(w,z,x) {
    translate([z,x,-3]) {
        difference() {
            translate([0,15,0]){cube([65,35,5.9],center=true);}
            union() {
                resize([55,w,6]) {
                    cylinder(6,w/2,w/2, center=true);
                }
                translate([-25,24,2.5]){rotate([0,0,45]){name(str(w));}}
            }
        }
    }
        
}
module name(t) {
    linear_extrude(height = .5) {
		text(t, size = 6, halign = "center", valign = "center", $fn = 16);
	}
}
stem(61,0,0);
stem(61.5,70,0);
stem(62,0,38);
stem(62.5,70,38);