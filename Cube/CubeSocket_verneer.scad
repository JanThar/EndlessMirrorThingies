cubeHeigth = 20;
socketRadius=55;

socketCube();
//translate([0,-40,0]) cube([125,125,1]);

module socketCube() { 
    difference() {
        
        union() {
            rotate([0,0,90]) cylinder(d=160,h=90,$fn=3);
            //rotate([0,0,-30]) cubeCorner();
//            hull() {
//                for (i=[0:6]) {
//                    rotate([0,0,i*60+30]) translate([0,socketRadius,0]) sphere(d=5,$fn=15);
//                    rotate([0,0,i*60+30]) translate([0,socketRadius,12]) sphere(d=5,$fn=15);
//                    rotate([0,0,i*60+30]) translate([0,12,2.5*12]) sphere(d=5,$fn=15);
//                }
//            }   
        }
        translate([0,0,-2.5]) rotate([0,90,30]) translate([0,0,-2.5])  resize([30,40,82]) cylinder(d=40, h=120, center=true, $fn=36);
        rotate([0,90,30]) translate([-6,0,100]) resize([10,20,200]) cylinder(d=10,h=200,$fn=36,center=true);
        translate([0,0,9*12-3]) rotate([0,180,0]) cylinder(d=25,h=10*12);
        translate([0,0,1*12-2.84]) rotate([45,-atan(sqrt(0.5)),-30]) 
        union() {
    cube([socketRadius*15,socketRadius*15,socketRadius*15]);
    hull() {
        translate([25,25,0]) cube([socketRadius*15-50,socketRadius*15-50,socketRadius*15]);
        translate([socketRadius*15/2,socketRadius*15/2,socketRadius*30]) sphere(d=5);
        translate([socketRadius*15/2,socketRadius*15/2,-socketRadius*15]) sphere(d=5);
    }
    hull() {
        translate([25,0,25]) cube([socketRadius*15-50,socketRadius*15,socketRadius*15-50]);
        translate([socketRadius*15/2,socketRadius*30,socketRadius*15/2]) sphere(d=5);
        translate([socketRadius*15/2,-socketRadius*15,socketRadius*15/2]) sphere(d=5);
    }
    hull() {
        translate([0,25,25]) cube([socketRadius*15,socketRadius*15-50,socketRadius*15-50]);
        translate([socketRadius*30,socketRadius*15/2,socketRadius*15/2]) sphere(d=5);
        translate([-socketRadius*15,socketRadius*15/2,socketRadius*15/2]) sphere(d=5);
    }
}
//cube([socketRadius*15,socketRadius*15,socketRadius*15]);
    }
}