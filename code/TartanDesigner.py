from turtle import *

maxDim = 200

setup (width=maxDim+10, height=maxDim+10)
screensize(maxDim, maxDim)
setworldcoordinates(0,maxDim,maxDim,0)
width(5)
speed(5)

#warp
color('red')
for x in range(0,maxDim,width()*2):
    setx(x)
    sety(0)
    goto([x, maxDim])


#weft
color('green')
for y in range(maxDim,0,-width()*2):
    sety(y)
    setx(0)
    goto([maxDim,y])

# done()
# exitonclick()
