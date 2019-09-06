
//mirror();
battery();

module battery() {
    difference() {
        union() {
            //cylinder(d=31+1,h=6.4+1,$fn=60,center=true);
            //translate([18,0,0]) sphere(d=5,h=5,$fn=20,center=true);
            i=4;
            hull() {
                translate([10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            
            hull() {
                translate([10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,10,3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,10,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([0,10,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([0,10,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,-10,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,-10,3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([-10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,-10,-3.3]) sphere(d=i,$fn=20,center=true);
            }
            hull() {
                translate([-10,0,3.3]) sphere(d=i,$fn=20,center=true);
                translate([-10,0,-3.3]) sphere(d=i,$fn=20,center=true);
                translate([0,-10,3.3]) sphere(d=i,$fn=20,center=true);
            }
        }
        translate([0,0,3.2+0.3]) rotate([0,90,0]) cube([1,1,100], center=true);
        translate([0,0,-3.2-0.3]) rotate([0,90,0]) cube([1,1,100], center=true);
        
        translate([16.5,0,0]) rotate([0,90,90]) cube([1,1,100], center=true);
        
        cylinder(d=21,h=6.4,$fn=60, center=true);
        //translate([0,32/4,0]) cube([31+1,(31+1)/2,6.4],center=true);
    }
}

//translate([0,0,30]) sphere(d=4,center=true, $fn=20);
module mirror() {
    difference() {
    rotate([45,-atan(sqrt(0.5)),-30])
    difference() {
        hull() {
            translate([15,15,15]) sphere(d=6, center=true, $fn=20);
            translate([15,-15,15]) sphere(d=6, center=true, $fn=20);
            translate([15,15,-15]) sphere(d=6, center=true, $fn=20);
            translate([15,-15,-15]) sphere(d=6, center=true, $fn=20);
            translate([-15,15,15]) sphere(d=6, center=true, $fn=20);
            translate([-15,-15,15]) sphere(d=6, center=true, $fn=20);
            translate([-15,15,-15]) sphere(d=6, center=true, $fn=20);
            translate([-15,-15,-15]) sphere(d=6, center=true, $fn=20);
        }
        union() {
            cube([24,36,24],center=true);
            cube([36,24,24],center=true);
            cube([24,24,36],center=true);
       
            translate([0,0,16.5]) cube([27,27,3],center=true);
            translate([0,0,-16.5]) cube([27,27,3],center=true);
            translate([0,16.5,0]) cube([27,3,27],center=true);
            translate([0,-16.5,0]) cube([27,3,27],center=true);
            translate([16.5,0,0]) cube([3,27,27],center=true);
            translate([-16.5,0,0]) cube([3,27,27],center=true);
        }
        
    }
    translate([0,0,60]) cylinder(d=5, h=100,center=true, $fn=20);
    //translate([0,0,23]) sphere(d=5, center=true, $fn=20);
    }
}
