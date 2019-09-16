from turtle import *

w = 2
sett = tuple(['green']*12 + ['red']*20) * 2

maxDim =len(sett)*w
setup(width=maxDim, height=maxDim)
screensize(maxDim, maxDim)
setworldcoordinates(0,maxDim,maxDim,0)

width(w)
speed(0)
register_shape("bar",( (w/2,0),(-w/2,0),(-w/2,w),(w/2,w) ))
shape("bar")

def tossShuttle():
    if heading() == 0.0:
        left(90)
        forward(w)
        left(90)
        settx(maxDim)
    else:
        right(90)
        forward(w)
        right(90)
        settx(0)

#warp
home()
for x, c in enumerate(sett):
    penup()
    goto([x*w, -3*w])
    pendown()
    color(c)
    goto([x*w, maxDim+3*w])
penup()

#weft
home()
start = 0
for x, c in enumerate(sett):
    color(c)
    treadle = start
    while 0 <= xcor() <= maxDim:
        if treadle < 2: stamp()
        treadle +=1
        if treadle > 3: treadle = 0
        forward(w)
    tossShuttle()
    start +=1
    if start > 3: start = 0

# getcanvas().postscript(file=__file__+".ps", colormode='color')

# done()
exitonclick()
