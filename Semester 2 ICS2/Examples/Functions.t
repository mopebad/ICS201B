%%% Subroutines

% Function: a subroutine that RETURNS the RESULT
function double(num : real) : real
   var answer : real
   answer := 2 * num
   result answer
end double

%%% MAIN PROGRAM %%%
var x : real
var ans : real

put "Please enter a value for x: " ..
get x 

put "Determine a value that is double ", x

ans := double (x)

put "A value that is double ", x, " is ", ans
