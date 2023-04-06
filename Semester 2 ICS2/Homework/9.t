var count : int := 0
var input : string

loop
    count := count + 1
    put "Loop execution number ", count, ""
    put "Type 'more' to continue."
    put "Type 'stop' to stop the loop."
    get input
    exit when input = "stop"
end loop

