from turtle import *
speed(0)

maxDim = 50
# color('red', 'yellow')
# begin_fill()
# while True:
#     forward(200)
#     left(170)
#     if abs(pos()) < 1:
#         break
# end_fill()

screensize(maxDim, maxDim)
setworldcoordinates(0,0,maxDim,maxDim)
width(10)
# exitonclick()

#warp
color('yellow')
for x in range(0,maxDim,5):
    setx(x)
    sety(0)
    goto([x, maxDim])


#weft
color('yellow')
for y in range(maxDim,0,-5):
    sety(y)
    setx(0)
    goto([maxDim,y])

done()
