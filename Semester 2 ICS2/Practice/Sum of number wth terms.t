% Program to find the sum of a predetermined number of terms
% Declare variables

var x, numTerms, term, sum : int

% User inputs
 
put "Enter the value of x: "
get x

put "Enter the number of terms to add: "
get numTerms

% Calculations
sum := 0

for i : 1 .. numTerms
  term := i * x
  sum := sum + term
end for

% Result/Sum




put "The sum of the terms is: ", sum
