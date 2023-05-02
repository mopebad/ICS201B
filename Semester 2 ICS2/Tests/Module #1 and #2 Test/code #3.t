var startNum : int 
var endNum : int

put "Where do you want to start: " ..
get startNum
put "Where do you want to end: " ..
get endNum

loop 
    put startNum .. put ""
    startNum := startNum - 3
    exit when startNum < endNum
    delay(400)
end loop 
