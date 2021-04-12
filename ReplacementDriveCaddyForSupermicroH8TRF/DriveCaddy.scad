caddyHeight=26.4;
caddyWidth=106.0;
caddyDepth=60.0;

caddyFrameWidth=5;

bezelThickness=15;
railHeight=19.0;
railThickness=1.8;
shelfThickness=1.0;
shelfWidth=10.0;

mountHoleDepth=19.0;
mountHoleHeight=7.0;
mountHoleDiameter=3.3;
mountHoleChamferDiameter=7.68;

airHoleDiameter=3.0;

pullTabWidth=20;

latchDetentRadius=1.8;
latchDetentHeight=22.8;

difference() {
    //build the caddy
    cube(
        size = [caddyWidth,caddyDepth,caddyHeight]
    ); 
    
    //empty out the caddy to the frame thickness
    translate([caddyFrameWidth,0,caddyFrameWidth]){
        cube(
            size=[
                caddyWidth-(2*caddyFrameWidth),
                caddyDepth,
                caddyHeight-(2*caddyFrameWidth)
            ]
        );
    };
    
    
    //holow out the caddy
    translate([railThickness, bezelThickness, shelfThickness]) {
        cube(
            size=[
                caddyWidth-(railThickness*2),
                (caddyDepth-bezelThickness),
                (caddyHeight-shelfThickness)
                ]
        );
    };
    
    
    //remove the top of the rails
      translate([0,
            bezelThickness,
            railHeight]) {    
        cube(size=[
            caddyWidth,
            caddyDepth-bezelThickness,
            caddyHeight-railHeight
        ]);
    }  

    //remove the floor
    translate([railThickness+shelfWidth, bezelThickness+shelfWidth, 0]) {
        cube(size=[
            caddyWidth-(railThickness*2)-(shelfWidth*2),
            (caddyDepth-bezelThickness-shelfWidth),
            (caddyHeight)
        ]);
    };    
    
    //cut the screw holes
    translate([
        caddyWidth/2,
        bezelThickness + mountHoleDepth,
        mountHoleHeight 
        ]){
        rotate(a=90, v=[0,1,0]) {
            $fn=100; 
            cylinder(
                    center=true,
                    h=caddyWidth,
                    r=mountHoleDiameter/2
                );
        }
    };
    
    //left screw hole bezel
    translate(
    [
       railThickness/4,
       bezelThickness + mountHoleDepth,
       mountHoleHeight 
    ]
    ) {
        rotate(a=-90, v=[0,1,0]) {
            $fn=20; 
            color("red")            
            cylinder(
                center=true,
                h=railThickness/2,
                r1=mountHoleDiameter/2,
                r2=mountHoleChamferDiameter/2
            );
        }
    };
    
    //right screwhole bezel
    translate(
    [
       caddyWidth-railThickness/4,
       bezelThickness + mountHoleDepth,
       mountHoleHeight 
    ]
    ) {
        rotate(a=90, v=[0,1,0]) {
            $fn=20;
            color("red")
            cylinder(
                center=true,
                h=railThickness/2,
                r1=mountHoleDiameter/2,
                r2=mountHoleChamferDiameter/2
            );
        }
    }; 
   
   
   //cut out the latch detents
    translate([caddyWidth,bezelThickness/2,latchDetentHeight]){
    rotate(-90,[1,0,0]){
    $fn=10;
    cylinder(r=latchDetentRadius, h=bezelThickness, center=true);
    }
    }
    translate([0,bezelThickness/2,latchDetentHeight]){
        rotate(-90,[1,0,0]){
        $fn=10;
        cylinder(r=latchDetentRadius, h=bezelThickness, center=true);
        }
    }
    
};
//Add a finger pull tab
translate([
    (caddyWidth/2)-(pullTabWidth/2),
    0,
    caddyHeight/2]) {
    minkowski() {
    cube(
        size=[pullTabWidth,bezelThickness/18,caddyWidth/10]
    );
        rotate(a=-90, v=[1,0,0]) {
            cylinder(r=2, h=bezelThickness/18);
        }
    };
}






