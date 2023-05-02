% Calculate the summation of a number in a series
% Code 2

% Declare Variables
var y, sum : int
var numTerms, power : int


% Get input from user
put "Enter the value of y: "
get y

put "Enter the number of terms: "
get numTerms

% Initialize variables
sum := 0
power := 1

% Loop through the terms and calculate the sum
for i : 1 .. numTerms
  sum := sum + power
  power := power * y

end for

% Print the result
put "The sum of the series is: ", sum


