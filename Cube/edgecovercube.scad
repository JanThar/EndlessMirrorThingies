cubeWall = 278;
cubeThickness = 1;
cubeSide = 32;

edgeCoverCube();

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
        }
        cube([3*cubeWall,3*cubeWall,3*cubeWall]);
    }
}