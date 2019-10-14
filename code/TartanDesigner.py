import os
from turtle import *
from PIL import Image

DEBUG = False
w = 4
c1 = [(15,15,15)]*2 ## colors are given by (R,G,B) value * number of threads
c2 = [(136,0,0)]*14
c3 = [(0,56,32)]*8
c4 = [(240,240,240)]*4
sett = tuple(c1 + c2 + c3 + c4 + c3 + c2)*3

maxDim = len(sett)*w
if DEBUG: print (len(sett), maxDim)
buffer = 20
setup(width=maxDim+buffer, height=maxDim+buffer,startx=200,starty=20)
screensize(maxDim, maxDim)
setworldcoordinates(0,maxDim,maxDim,0)
if DEBUG:
    print(screensize())
if screensize()[0] != maxDim or screensize()[1] != maxDim:
    print ("WARNING: Screensize is not set to the maxDim ({}), you likely have aspect warping. Try changing the buffer variable.".format(maxDim))

width(w)
speed(10)
tracer(2)
colormode(255)
register_shape("bar",( (w/2,0),(-(w/2),0),(-(w/2),2*w),(w/2,2*w) ))
shape("bar")
hideturtle()

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

    # shade lines
    t2.penup()
    t2.goto([x*w-w, -3*w])
    t2.pendown()
    t2.color([int(0.8*x) for x in c])
    t2.goto([x*w-w, maxDim+3*w])
penup()


#weft
home()
treadle = 0
for x, c in enumerate(sett):
    # color("", c)
    color([int(0.8*x) for x in c], c)
    forward(treadle*w)

    # if DEBUG: print("Heading: {0:5}, Treadle: {2}, Coords: {1}".format(heading(), pos(), treadle))

    while 0 <= xcor() < maxDim:
        stamp()
        forward(4*w)
    tossShuttle()
    treadle +=1
    if treadle > 3: treadle = 0

if not DEBUG:
    try:
        getcanvas().postscript(file=__file__+".eps", colormode='color')
        Image.open(__file__+".eps").save(__file__+".png")
        os.startfile(__file__+".png")
    except IOError:
        print("cannot save image")

exitonclick()
