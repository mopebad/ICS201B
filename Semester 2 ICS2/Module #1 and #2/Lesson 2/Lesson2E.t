%RANDOM EXIT PROGRAM!
var number:real
randomize

    loop
    for count:1..10
    rand(number)
    %pick from 0 to 1
    %0.000000 to 0.999999 
    %randomly pick a number
    put "Your number is ",number
    exit when number<=0.30
    put "This is round #",count
    delay(500)
end for
end loop
