#! /usr/bin/env python3
import sys, math

from solid import scad_render_to_file
from solid.objects import *
from solid.utils import *

from euclid3 import Point2, Point3, Vector3

SEGMENTS = 48

def ogee(radius, thickness):
    og  = translate([-radius,0,0])(arc(radius, 0, 90))
    og += translate([radius,0,0])(arc_inverted(radius, 180, 270))
    og += translate([-radius,-radius,0])(square(radius))
    return rotate(a=90, v=[0,1,0])(linear_extrude(thickness)(og))

def pointsAlongArc(radius, startAng, stopAng):
    angles = []
    for i in range(SEGMENTS):
        angles.append(math.radians(startAng) + i * (math.radians(stopAng) - math.radians(startAng))/float(SEGMENTS))
    pts = []
    for ang in angles:
        pts.append(Point3(radius * math.sin(ang), radius * math.cos(ang)))
    return pts

if __name__ == '__main__':
    out_dir = sys.argv[1] if len(sys.argv) > 1 else None

    # post = translate([-2.5,-2.5,-48])(cube([5,5,84], False)) + translate([-2.5,-1.5,36])(cube([5,3,6], False)) + translate([-2.5,-2.5,42])(cube([5,5,30], False))
    # rail = translate([-24,-3,0])(rotate(a=90,v=[0,0,1])(ogee(3,1.5))) + translate([-21,-3,-3])(cube([48,1.5,6], False)) + translate([30,-1.5,0])(rotate(a=270,v=[0,0,1])(ogee(3,1.5)))
    # a = post + translate([0,0,39])(rail) + translate([0,4.5,39])(rail)
    
    
    a = extrude_along_path( shape_pts=square(3, True), path_pts=pointsAlongArc(24,180,90))
    
    # Adding the file_header argument as shown allows you to change
    # the detail of arcs by changing the SEGMENTS variable.  This can
    # be expensive when making lots of small curves, but is otherwise
    # useful.
    file_out = scad_render_to_file(a, out_dir=out_dir, file_header=f'$fn = {SEGMENTS};')
    print(f"{__file__}: SCAD file written to: \n{file_out}")