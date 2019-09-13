from turtle import *
from time import sleep
# from PIL import Image


maxDim = 200
setup(width=maxDim+10, height=maxDim+10)
screensize(maxDim, maxDim)
setworldcoordinates(0,maxDim,maxDim,0)

width(5)
speed(10)

def tossShuttle():
    # print ("starting shuttle toss", heading(), pos())
    if heading() == 0.0:
        left(90)
        forward(width())
        left(90)
        setx(maxDim)
    else:
        right(90)
        forward(width())
        right(90)
        setx(0)
    print ("leaving shuttle toss", heading(), pos())
    # sleep(1)

#warp
home()
color('red')
for x in range(0,maxDim,width()*2):
    goto([x, maxDim])
    goto([x+width(), maxDim])
    goto([x+width(), 0])
    goto([x+width()*2, 0])

#weft
home()
color('green')
while ycor() < maxDim:
    for i in range(4):
        forward(i*width())
        while 0 <= xcor() <= maxDim:
            forward(2*width())
            penup()
            forward(2*width())
            pendown()
        tossShuttle()


getcanvas().postscript(file=__file__+".ps", colormode='color')

# done()
exitonclick()
