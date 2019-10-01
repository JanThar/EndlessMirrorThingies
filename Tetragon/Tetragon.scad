
difference() {
    translate([5,-2.6+0.85,-3.4]) cube([140,3.1,6.8]);
    translate([0,0,-1]) rotate([-70.53/2,0,0]) translate([0,0,-1.5]) pyramidSide();
    translate([0,0,1]) rotate([70.53/2,0,0]) translate([0,0,1.5]) pyramidSide();
}



//translate([0,0,-1]) rotate([-70.53/2,0,0]) translate([0,0,-1.5]) pyramidSide();
//translate([0,0,1]) rotate([70.53/2,0,0]) translate([0,0,1.5]) pyramidSide();



module pyramidSide() {
    difference() {
        translate([0,0,-1.5])cube([150,150,3]);
        translate([150,0,-2.5]) rotate([0,0,30]) cube([150,1500,5]);
        translate([0,0,-2.5]) rotate([0,0,-30]) translate([-150,0,0]) cube([150,1500,5]); 
    }
}