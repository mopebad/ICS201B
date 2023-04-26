var 
    ans,base,height:real

function triangle(base:real,height:real):real
    result (base*height)/2
end triangle

put "Put the base of the triangle in cm"

get base

put "Put the height of the triangle in cm"

get height

ans := triangle(base,height)

put "The area of your triangle is ", ans," cm2"

