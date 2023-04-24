% Program to calculate x^2 + 3x + 7

var x : real
var ans : real

% Ask user for value of x
put "The equation is x**2 + 3x +7"
put "Please enter a value for x: " 
get x



% Define function to calculate x^2 + 3x + 7
function eq (num : real) : real
result (x**2 + 3*x + 7)
end eq


% Output result to user
put "Calculating answer..."

delay(800)

ans:=eq(1)

put "The answer is ", ans 

