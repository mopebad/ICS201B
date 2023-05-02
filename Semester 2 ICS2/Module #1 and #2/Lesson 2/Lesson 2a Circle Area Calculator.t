%The Circle Area Calculator V5
var radius, area:real
const pi:=3.14159
%:= means make this equal to that

put "To end the program type -1"
loop
    put "Enter the radius of your circle"
    get radius
    exit when radius=-1
    %check if the value i
    s equal
    area:=pi*radius**2
    put "The Area is ",area:1:2, "cm2"
end loop
put "Great! You are all done!"

%The Circle Area Calculator V6
var radius, area:real
const pi:=3.14159
%:= means make this equal to that

put "To end the program type ANY negative #"
loop
    put "Enter the radius of your circle"
    get radius
    exit when radius= < 0 
    %check if the value i
    s equal
    area:=pi*radius**2
    put "The Area is ",area:1:2, "cm2"
end loop
put "Great! You are all done!"
