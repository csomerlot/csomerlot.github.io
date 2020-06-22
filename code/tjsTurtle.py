from turtle import *


color('black', 'green')
begin_fill()
while True:
    forward(200)
    left(200)
    if abs(pos()) < 1:
        break
end_fill()
right(100)
circle(100)
done()

penup()
left()
pendown()

color('black', 'green')
begin_fill
while True:
    foward(200)
    left(200)
    if abs(pos()) < 2:
        break
end_fill
right(100)
circle(100)
done()
