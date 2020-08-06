translate([0,0,0]){
        linear_extrude(height=6) {
    scale([.54,.54,.54]){
        $fn=360;
            import("logo.svg", center=true);
        }
    }
}

module outerclip() {
    $fn=360;
    intersection() {
        hull() {
            translate([-4,0,0]){cylinder(8,26.5, 26.5, center=true);}
            translate([4,0,0]){cylinder(8,26.5, 26.5, center=true);}
            //translate([64,14,0]){sphere(10);}
            //translate([64,-14,0]){sphere(10);}
        }
        union() {
            cube([80,80,6], center=true); 
            //translate([62,14,0]){cube([10,14,10], center=true);}
        }
    }
}
module innerclip() {
    $fn=360;
    intersection() {
        hull() {
            translate([3,0,0]){cylinder(12,25,25, center=true);}
            translate([-3,0,0]){cylinder(12,25,25, center=true);}
        }
       cube([58,58,12], center=true);
    }
}
module clip() {
    translate([0,0,34]){
        rotate([90,90,0]){
            difference() {
                outerclip();
                innerclip();
            }
        }
    }
    translate([26.5,0,17]){cube([3,6,30], center=true);}
    translate([-26.5,0,17]){cube([3,6,30], center=true);}
}
translate([0.05,69,0]){clip();}
translate([0.05,-70,0]){clip();}

module cradle() {
    $fn=360;
    intersection(){
        translate([0,-7.5,31]){
            rotate([90,90,0]){
                difference(){
                    cylinder(145,30,30, center=true);
                    cylinder(146,25,25, center=true);
                }
            }
        }
        //translate([0,-7.5,11]){cube([50,145,20], center=true);}
        union() {            
            translate([0,-70,11]){cube([50,20,20], center=true);}
            translate([0,55,11]){cube([50,20,20], center=true);}
            translate([0,-7.5,11]){cube([33,105,20], center=true);}
        }
    }
}
translate([.05,7,0]){cradle();}
/*
minkowski() {
    clip();
    sphere(0.75);
}
*/