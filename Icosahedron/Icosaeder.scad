
ledDistance = 1000/144; // in mm,  common 1000/144 1000/60 1000/30
triangleLength = 150; // length in mm

numberOfLeds = floor((triangleLength-ledDistance) / ledDistance);
cornerTriangle = 6.7;
cornerOffset = (triangleLength-numberOfLeds*ledDistance)/2+cornerTriangle-ledDistance/2;
a=138.18986;
b=58.2825;
c=31.71747;
d=29.15;
gap=2;

socketHeight=triangleLength/10;
socketRadius=triangleLength/3;
wallThickness=0.5;
wallOffset=15;
wallSide=6;

cubeHeigth = 20;
cubeSide = 16*2;
cubeWall = 278;
cubeThickness = 1;

//connector();
//stripe();
//projection(cut = false) rotate([0,90,0]) diffusor();
//socketCube();
//socket();
//cap();
//stripCover();
edgeCoverCube();
//cube([140,12,0.4]);



module edgeCoverCube() {
    difference() {
        intersection() {
            difference() {
                cube([cubeWall+cubeThickness*2,cubeWall+cubeThickness*2,cubeWall+cubeThickness*2],center=true);
                cube([cubeWall,cubeWall,cubeWall],center=true);
                cube([cubeWall-cubeSide,cubeWall-cubeSide,2*cubeWall],center=true);
                cube([cubeWall-cubeSide,2*cubeWall,cubeWall-cubeSide],center=true);
                cube([2*cubeWall,cubeWall-cubeSide,cubeWall-cubeSide],center=true);
            }
            rotate([0,0,-45]) translate([0,0,-3*cubeWall/2]) cube([3*cubeWall,3*cubeWall,3*cubeWall]);
            
            rotate([45,0,0]) cube([3*cubeWall,3*cubeWall,3*cubeWall]);
            //rotate([45,0,0]) cube([3*cubeWall,3*cubeWall,3*cubeWall]);
        }
        cube([3*cubeWall,3*cubeWall,3*cubeWall]);
    }
}

module cubeCorner() {
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([socketRadius*1.5,0,0]) sphere(0.1);
            translate([0,cubeHeigth,0]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([socketRadius*1.5,0,0]) sphere(0.1);
            translate([0,0,cubeHeigth]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([cubeHeigth,0,0]) sphere(0.1);
            translate([0,0,socketRadius*1.5]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([0,cubeHeigth,0]) sphere(0.1);
            translate([0,0,socketRadius*1.5]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([0,socketRadius*1.5,0]) sphere(0.1);
            translate([0,0,cubeHeigth]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
    hull() {
        translate([0,0,6*12-3]) rotate([45,-atan(sqrt(0.5)),0]) {
            translate([0,0,0]) sphere(0.1);
            translate([cubeHeigth,0,0]) sphere(0.1);
            translate([0,socketRadius*1.5,0]) sphere(0.1);
        }
        rotate([0,0,0]) translate([0,0,5*12]) sphere(d=5,$fn=15);
    }
}

module stripCover() {
    difference(){
        translate([-(12+2*wallThickness)/2,-4,0]) cube([12+2*wallThickness, wallSide+wallThickness, triangleLength+wallOffset+cornerTriangle*2]);
        translate([-12/2,-3.5,0]) cube([12, wallSide, triangleLength+wallOffset+cornerTriangle*2]);
        translate([0,0,0]) corner(); // for end
        translate([0,0,triangleLength+wallOffset+cornerTriangle*2]) mirror([0,0,1]) corner(); // for end
    }
}

module cap() {
    intersection() {
        union() {
            //translate([0,0,-2.6]) rotate([0,0,-18]) cylinder(d=11.5,h=0.6,$fn=5);
            difference() {
                for (i=[1:5]) {
                    difference() {
                        x=0;//d;
                        rotate([-x,0,i*72]) translate([-6,-1,0]) cube([12,30,0.5]);
                        rotate([-x,0,(i+1)*72]) translate([-6,0,0.5]) cube([12,40,100]);
                        rotate([-x,0,(i-1)*72]) translate([-6,0,0.5]) cube([12,40,100]);
                    }
        //            size=4.9;
        //            difference() {
        //                rotate([-d+2.4,0,i*72+36]) translate([-size/2,-1,0]) cube([size,16.04,0.5]);
        //                rotate([-d+2.4,0,(i+1)*72+36]) translate([-size/2,0,0.5]) cube([size,20,100]);
        //                rotate([-d+2.4,0,(i-1)*72+36]) translate([-size/2,0,0.5]) cube([size,20,100]);
        //            }
                }
               // translate([0,0,48]) cube([100,100,100], center=true);
            }
        }
        translate([0,0,-40]) rotate([0,0,-18+36]) cylinder(d=50,h=500,$fn=5);
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
                }
                for (i=[0:6]) {
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
        //cube([1000,1000,1000]);
    }
}



module socket() { 
    difference() {
        union() {
            translate([0,0,6*12]) rotate([0,180,0]) for (i=[1:5]) {
                hull() {
                    rotate([-d,0,i*72]) translate([-(12+2*wallThickness)/2,-1,0]) cube([12+2*wallThickness,socketRadius,0.5]);
                    rotate([0,0,(i-1)*72-18]) translate([-12,0,1.1*12]) sphere(d=5,$fn=15);
                }
            }
            hull() {
                for (i=[0:5]) {
                    rotate([0,0,i*72]) translate([0,socketRadius,0]) sphere(d=5,$fn=15);
                    rotate([0,0,i*72]) translate([0,socketRadius,12]) sphere(d=5,$fn=15);
                }
                for (i=[0:5]) {
                    rotate([0,0,i*72]) translate([0,12+2*wallThickness,2.5*12]) sphere(d=5,$fn=15);
                }
            }   
            hull() {
                for (i=[0:5]) {
                    rotate([0,0,i*72]) translate([0,12+2*wallThickness,2.5*12]) sphere(d=5,$fn=15);
                    intersection() {
                        rotate([0,0,i*72+36]) translate([0,12+2*wallThickness,6.5*12]) sphere(d=5,$fn=15);
                        translate([0,0,6*12]) rotate([0,180,0]) 
                        for (i=[1:5]) {
                            hull() {
                                rotate([-d,0,i*72]) translate([-(12+2*wallThickness)/2,-1,0]) cube([12+2*wallThickness,socketRadius,0.5]);
                                rotate([0,0,(i-1)*72-18]) translate([-12,0,1.1*12]) sphere(d=5,$fn=15);
                            }
                        }
                    }
                }
            }  
        }
        resize([socketRadius*1.5,socketRadius*1.5,12*5]) sphere(d=1, $fn=36);
        translate([0,-socketRadius+34.5,6]) rotate([90,90,0]) union() { // power plug
            cylinder(d=11.5,h=30,$fn=15);
            translate([0,0,0])cylinder(d=15,h=25,$fn=6);
        }
        translate([0,0,6*12]) rotate([0,180,0]) for (i=[1:5]) {
            rotate([-d,0,i*72]) translate([-(12+2*wallThickness)/2,-1,-5]) cube([12+2*wallThickness,socketRadius,5]);
        }
        cylinder(d=22,h=100);
        
        //cube([1000,1000,1000]);
    }
}

module connector(){
    difference(){
        hull(){
            rotate([0,0,-c/2]) translate([0.5,gap,-0]) cube([2.8,gap,triangleLength+cornerTriangle*2]);
            mirror([1,0,0]) rotate([0,0,-c/2]) translate([0.5,gap,-0]) cube([2.8,gap,triangleLength+cornerTriangle*2]);

            translate([3.4/2,0,0]) rotate([0,0,180]) cube([3.4,4.6,triangleLength+cornerTriangle*2]); 
            translate([3,1.7,0]) rotate([0,0,180]) cube([6,5,triangleLength+cornerTriangle*2]);
            translate([-6.3,-1-5.4+5,0]) cube([12.6,1,triangleLength+cornerTriangle*2]);
            translate([-6,-1-5.4+2+1,0]) cube([12,1,triangleLength+cornerTriangle*2]);
        }
        rotate([0,0,-a/2]) translate([0.5,gap,-0]) cube([2.8,gap*2,triangleLength+cornerTriangle*2]);
        mirror([1,0,0]) rotate([0,0,-a/2]) translate([0.5,gap,-0]) cube([2.8,gap*2,triangleLength+cornerTriangle*2]);
    stripe();
    translate([0,0,0]) corner(); // for end
    translate([0,0,triangleLength+cornerTriangle*2]) mirror([0,0,1]) corner(); // for end
    }
}


module corner() {
    translate([0,-6,0]) rotate([0,b/2,c/2]) translate([0,0,0]) cube([20,20,20]);
    translate([0,-6,0]) mirror([1,0,0]) rotate([0,b/2,c/2]) translate([0,0,0]) cube([20,20,20]);
    translate([-20,-20,-40]) cube([40,40,40]);
}

module diffusor() {
    union(){
        for(i=[0:numberOfLeds]) {
            hull() {
                translate([-1.5,2,i*ledDistance+(ledDistance-5.2+(5.2-3))/2+cornerOffset]) cube([3,1,3]);
                translate([-1.5,5,i*ledDistance+cornerOffset]) cube([3,3,ledDistance]);
            }
        }
    } 
}

module stripe(){
    translate([0,-5.4+1.5+0.5,-0])
    union(){
        translate([-6,-2,0]) cube([12,2,triangleLength+cornerTriangle*2]);
        for(i=[0:numberOfLeds]) {
            translate([-2.6,0,i*ledDistance+(ledDistance-5.8)/2+cornerOffset]) cube([5.2,2,5.8]);
            hull() {
                translate([-2.6,0,i*ledDistance+(ledDistance-5.8)/2+cornerOffset]) cube([5.2,1,5.8]);
                translate([-3,-1,i*ledDistance+(ledDistance-5.8)/2+cornerOffset]) cube([6,1,5.8]);
            }
            translate([-2.6+5.9,0,i*ledDistance+1.1+(ledDistance-5.2)/2+cornerOffset]) cube([2,1,3]);
            translate([2.6-5.9-2,0,i*ledDistance+1.1+(ledDistance-5.2)/2+cornerOffset]) cube([2,1,3]);
        }
        diffusor();
    }
}
