import os
from turtle import *
from PIL import Image

DEBUG = True
w = 12
sett = tuple([(0,0.4,0)]*8 + [(0.6,0,0)]*12) * 3

maxDim =len(sett)*w
setup(width=maxDim, height=maxDim)
screensize(maxDim, maxDim)
setworldcoordinates(0,maxDim,maxDim,0)

width(w)
speed(0)
tracer(2)
# register_shape("bar",( (w/2-1,1),(-(w/2-1),1),(-(w/2-1),2*w-1),(w/2-1,2*w-1) ))
# w = 12
register_shape("bar",( (5,1),(-5,1),(-5,23),(5,23) ))
shape("bar")

def tossShuttle():
    if heading() == 0.0:
        left(90)
        forward(w)
        left(90)
        setx(maxDim)
    else:
        right(90)
        forward(w)
        right(90)
        setx(0)

#warp
home()
t2 = Turtle()
t2.width(1)
t2.home()
for x, c in enumerate(sett):
    penup()
    goto([x*w-w/2, -3*w])
    pendown()
    color(c)
    goto([x*w-w/2, maxDim+3*w])

    # shade
    t2.penup()
    t2.goto([x*w-w, -3*w])
    t2.pendown()
    t2.color([0.9*x for x in c])
    t2.goto([x*w-w, maxDim+3*w])
penup()


#weft
home()
treadle = 0
for x, c in enumerate(sett):
    # color("", c)
    color([0.9*x for x in c], c)
    forward(treadle*w)

    if DEBUG: print("Heading: {0:5}, Treadle: {2}, Coords: {1}".format(heading(), pos(), treadle))

    while 0 <= xcor() < maxDim:
        stamp()
        forward(4*w)
    tossShuttle()
    treadle +=1
    if treadle > 3: treadle = 0


getcanvas().postscript(file=__file__+".eps", colormode='color')
try:
    Image.open(__file__+".eps").save(__file__+".png")
except IOError:
    print("cannot convert", __file__+".eps")

exitonclick()
if not DEBUG: os.startfile(__file__+".png")
