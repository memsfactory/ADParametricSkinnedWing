//https://github.com/memsfactory/ADParametricSkinnedWing/blob/master/airfoil_loft_w_skin_win_20200828A.scad
//Thank you to all the Openscad library codes who made this possible.

use <scad-utils/transformations.scad>
use <BOSL2/std.scad>  //The order is important due to conflicts?
use <scad-utils/skin.scad>

                 

e471_points = [[1000,0],[996.99,0.85],[988.31,3.44],[974.63,7.63],[956.49,12.93],[934.07,18.78],[907.37,24.92],[876.6,31.35],[842.17,37.9699],[804.53,44.6099],[764.14,51.08],[721.44,57.12],[676.81,62.52],[630.65,67.12],[583.34,70.77],[535.27,73.39],[486.81,74.94],[438.4,75.5],[390.52,75.0799],[343.68,73.7199],[298.33,71.4299],[254.93,68.26],[213.91,64.25],[175.66,59.46],[140.54,53.97],[108.88,47.8499],[80.95,41.2099],[56.95,34.17],[37.07,26.88],[21.4099,19.53],[10.02,12.38],[2.92,5.73],[0.01,0.23],[2.39,-3.42],[10.71,-5.8],[24.3899,-7.32],[43.44,-7.77],[67.77,-7.22],[97.26,-5.74],[131.71,-3.47],[170.8,-0.59],[214.17,2.7],[261.32,6.21],[311.71,9.75],[364.72,13.16],[419.71,16.27],[475.97,18.9399],[532.79,21.05],[589.4,22.5199],[645.07,23.28],[699.02,23.3],[750.54,22.56],[798.89,21.12],[843.41,19.02],[883.46,16.35],[918.44,13.22],[947.83,9.75],[970.96,6.1],[987.3,2.87],[996.87,0.72]];



ah80140_points = [[1000,0],[998.93,0.97],[995.72,1.61],[990.39,2.46],[982.96,3.47],[973.47,4.77],[961.94,6.25],[948.44,8.06],[933.01,10.08],[915.73,12.47],[896.68,15.11],[875.92,18.16],[853.55,21.52],[829.67,25.35],[804.38,29.53],[777.79,34.2],[750,39.27],[721.14,44.87],[691.34,50.82],[660.72,57.24],[629.41,63.95],[597.55,71.05],[565.26,78.22],[532.6999,85.5],[500,92.56],[467.3,99.27],[434.74,104.97],[402.4499,109.25],[370.5899,111.84],[339.28,113.15],[308.66,113.12],[278.86,112],[250,109.68],[222.21,106.35],[195.6199,101.98],[170.33,96.91],[146.45,91.05],[124.08,84.7],[103.32,77.67],[84.27,70.24],[66.9899,62.29],[51.56,54.21],[38.0599,45.84],[26.53,37.74],[17.04,29.75],[9.61,22.34],[4.28,15.11],[1.07,8.12],[0,0],[1.07,-5.87],[4.28,-10.64],[9.61,-14.76],[17.04,-17.98],[26.53,-20.6501],[38.0599,-22.57],[51.56,-24.2301],[66.9899,-25.4],[84.27,-26.44],[103.32,-27.1],[124.08,-27.66],[146.45,-27.92],[170.33,-28.12],[195.6199,-28.04],[222.21,-27.87],[250,-27.48],[278.86,-27.08],[308.66,-26.51],[339.28,-25.95],[370.5899,-25.23],[402.4499,-24.54],[434.74,-23.69],[467.3,-22.8],[500,-21.75],[532.6999,-20.66],[565.26,-19.39],[597.55,-18.12],[629.41,-16.72],[660.72,-15.36],[691.34,-13.92],[721.14,-12.52],[750,-11.07],[777.79,-9.67],[804.38,-8.28],[829.67,-7.03],[853.55,-5.82],[875.92,-4.79],[896.68,-3.82],[915.73,-3.06],[933.01,-2.3901],[948.44,-1.93],[961.94,-1.52],[973.47,-1.2801],[982.96,-1.08],[990.39,-1.01],[995.72,-0.93],[998.93,-0.8]];

// Points from sd7037.dat in the archive: http://m-selig.ae.illinois.edu/ads/archives/coord_seligFmt.tar.gz
// Not necessarily in the same order as in: http://m-selig.ae.illinois.edu/ads/coord/sd7037.dat

sd7037_points = [[1000,0],[996.72,0.42],[987.07,1.8],[971.46,4.36],[950.41,8.1099],[924.5,12.95],[894.25,18.65],[860.15,24.8999],[822.6099,31.41],[782.01,37.8799],[738.65,44.13],[692.94,50.11],[645.39,55.72],[596.55,60.85],[546.93,65.3799],[497.06,69.17],[447.45,72.1099],[398.6199,74.1],[351.01,75.04],[305.08,74.88],[261.25,73.58],[219.89,71.13],[181.37,67.54],[146.01,62.86],[114.1,57.15],[85.86,50.49],[61.46,42.9999],[41.02,34.86],[24.62,26.32],[12.32,17.7],[4.18,9.36],[0.21,1.85],[1.27,-3.93],[8.06,-8.39],[20.38,-12.27],[38,-15.41],[60.74,-17.77],[88.44,-19.34],[120.84,-20.17],[157.65,-20.32],[198.5,-19.87],[242.96,-18.91],[290.5499,-17.54],[340.71,-15.86],[392.88,-13.96],[446.43,-11.9001],[500.74,-9.76],[555.19,-7.6],[609.14,-5.49],[661.9699,-3.49],[713.05,-1.68],[761.78,-0.14],[807.52,1.0399],[849.64,1.82],[887.56,2.2],[920.71,2.18],[948.59,1.85],[970.77,1.32],[986.9,0.71],[996.71,0.21]];

span=290;
root_chord = 200;
tip_chord = 150;
sweep_LE = 10;
skin_thickness = .4;
washout = 2;  //tip washout angle
dihedral_angle = 5; //

dihed_Y = tan(dihedral_angle) * span;

echo (len(e471_points));
echo (len(sd7037_points));
echo (len(ah80140_points));
echo ("***************");

scale_factor = root_chord/1000;
            
// scaling airfoil to the correct chord length
sd7037_scaled = [ for (i = [0:len(sd7037_points)-1]) root_chord/1000*sd7037_points[i] ];
    
e471_scaled = [ for (i = [0:len(e471_points)-1]) tip_chord/1000*e471_points[i] ];
ah80140_scaled = [ for (i = [0:len(ah80140_points)-1]) tip_chord/1000*ah80140_points[i] ];
 

// Scaling done by scale factor x and y
//sd7037_scaled_offset_neg = [ for (i = [0:len(sd7037_points)-1]) (root_chord-.5)/1000*sd7037_points[i] ];

sd7037_scaled_offset_neg= offset(sd7037_scaled, delta=-(skin_thickness), closed=true);
e471_scaled_offset_neg = offset(e471_scaled, delta=-(skin_thickness), closed=true);
ah80140_scaled_offset_neg = offset(ah80140_scaled, delta=-(skin_thickness), closed=true);


module wing_outer(profile_inboard, profile_outboard) {
 translate([0,0,0]) skin([
	transform(translation([0,0,0]), profile_inboard), // transform in scadutils is some sort of vector conversion operation that is required
	transform(translation([sweep_LE,dihed_Y, span])*rotation([0,0,washout]), profile_outboard)
    ]);
    
}
    
module wing_inner(profile_inboard, profile_outboard) {
    translate([0,0,0]) skin([
	transform(translation([0,0,-.1]), profile_inboard),
	transform(translation([sweep_LE,dihed_Y, span+.1])*rotation([0,0,washout]), profile_outboard)
    ]);
    
   /* code to mirror
    translate([0,0,0]) skin([
	transform(translation([0,0,0]), e471_points),
	transform(translation([500,50, -span]), ah80140_scaled )
]);
    */
}        
$fn= 360;

w = 150;       // overisized width of rectangle for boolean intersection
h = skin_thickness;       // rib sheet thickness
l = span*3;      // length of chord of the curve
dh = 80;           // delta height of the curve, curvature 
rib_spacing = 40; //spacing between ribs
rib_angle = 10; 

module curve(width, height, length, dh) {
    r = (pow(length/2, 2) + pow(dh, 2))/(2*dh);
    a = 2*asin((length/2)/r);
    rotate ([90,0,0]) translate([-(r -dh), 0, -w/2]) rotate([0, 0, -a/2]) rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}





//ribs module creates the ribbed internal cross hatch pattern which is purposely oversized
module ribs() {
rotate([0, -rib_angle,0]) translate ([-root_chord,-w/2,-span/2]) for (i = [0:3*span/rib_spacing]) translate ([i*rib_spacing,0,0]) curve(w, h, l, dh); 

translate ([root_chord,0,0])rotate([0,0,180])   rotate([0, -rib_angle,0]) translate ([-root_chord,-w/2,-span/2]) for (i = [0:3*span/rib_spacing]) translate ([i*rib_spacing,0,0]) curve(w, h, l, dh);  
}

module rib_holes(dia1, dia2, spanA, cX, cY, cZ, spc, spc_no) {
     
for (i = [0:spc_no-1]) {    
    translate([cX+(i*spc), cY, cZ])rotate([-dihedral_angle,0,0])linear_extrude(height = spanA,  
        center = false, convexity = 10, scale=dia2/dia1, $fn=100) 
         circle(r = dia1);
}
}

//---------------START of Main Program --------

//example of morphing skinning two different airfoils from root to tip with washout
   

#difference() {  //Subtract inner wing solid from outer wing solid to get skinned wing
    wing_outer(sd7037_scaled, e471_scaled); 
    wing_inner(sd7037_scaled_offset_neg,e471_scaled_offset_neg);
 }
    
intersection() { //intersection of inner wing SOLID and the cross hatched OvERSIZED rib structure
    wing_inner(sd7037_scaled_offset_neg,e471_scaled_offset_neg);
    difference() {
    ribs();
        {color("green")rib_holes(dia1=5, dia2=2, spanA=span*.7, cX=45, cY=9.5, cZ=25, spc=28, spc_no=2);
        color("green")rib_holes(dia1=5, dia2=2, spanA=span*.7, cX=90, cY=10, cZ=25, spc=20, spc_no=2);
        }
    }
} 
    
//example of using OFFSET command to subtract while managing polygon list format - not exactly sure why this works
   /* difference() 
{
    color("green")linear_extrude(height=20, center=true) polygon(sd7037_scaled);
    linear_extrude(height=21, center=true)offset( delta=-skin_thickness, chamfer=true) polygon(sd7037_scaled_offset_neg);
}
*/
