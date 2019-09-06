cubeHeigth = 20;
socketRadius=50;

socketCube();

module cubeCorner() {
    cornerHull(socketRadius*1.5, 0,                cubeHeigth,       0);
    cornerHull(socketRadius*1.5, 0,                0,                cubeHeigth);
    cornerHull(cubeHeigth,       0,                0,                socketRadius*1.5);
    cornerHull(0,                cubeHeigth,       0,                socketRadius*1.5);
    cornerHull(0,                socketRadius*1.5, 0,                cubeHeigth);
    cornerHull(cubeHeigth,       0,                socketRadius*1.5, 0);
}

module cornerHull(a, b, e, f) {
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([a,b,0]) sphere(0.1);
            translate([0,e,f]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
}

module socketCube() { 
    difference() {
        union() {
            rotate([0,0,-30]) cubeCorner();
            hull() {
                for (i=[0:6]) {
                    rotate([0,0,i*60+30]) translate([0,socketRadius,0]) sphere(d=5,$fn=15);
                    rotate([0,0,i*60+30]) translate([0,socketRadius,12]) sphere(d=5,$fn=15);
                    rotate([0,0,i*60+30]) translate([0,12,2.5*12]) sphere(d=5,$fn=15);
                }
            }   
            hull() {
                for (i=[0:6]) {
                    rotate([0,0,i*60+30]) translate([0,12,2.5*12]) sphere(d=5,$fn=15);
                    rotate([0,0,i*60]) translate([0,12,7*12]) cylinder(d=5, h=2.5,$fn=15);
                }
            }  
        }
        resize([socketRadius*1.5,socketRadius*1.5,12*5]) sphere(d=1, $fn=36);
        translate([0,-socketRadius+29.5+2,6]) rotate([90,0,0]) union() { // power plug
            cylinder(d=11.5,h=30,$fn=15);
            translate([0,0,0])cylinder(d=15,h=25,$fn=6);
        }
        translate([0,0,9*12-3]) rotate([0,180,0]) cylinder(d=18,h=10*12);
        translate([0,0,6*12-2.84]) rotate([45,-atan(sqrt(0.5)),-30]) cube([socketRadius*1.5,socketRadius*1.5,socketRadius*1.5]);
    }
}