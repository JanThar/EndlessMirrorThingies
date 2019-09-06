cubeHeigth = 20;
socketRadius=55;

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
        translate([0,0,1*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([a,b,0]) sphere(0.1);
            translate([0,e,f]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,0*12]) sphere(d=5,$fn=15);
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
        }
        translate([0,0,-2.5]) rotate([0,90,30]) resize([30,40,85]) cylinder(d=40, h=120, center=true, $fn=36);

       rotate([0,90,30]) translate([-6,0,100]) resize([10,20,200]) cylinder(d=10,h=200,$fn=36,center=true);


        translate([0,0,9*12-3]) rotate([0,180,0]) cylinder(d=18,h=10*12);
        translate([0,0,1*12-2.84]) rotate([45,-atan(sqrt(0.5)),-30]) cube([socketRadius*1.5,socketRadius*1.5,socketRadius*1.5]);
    }
}