% waiting game


var num : int := 100
for i : 1 .. num
    put i
    if i > 20
    then put "You waited long enough congrats!"
    end if 
    delay(1000)
end for 

