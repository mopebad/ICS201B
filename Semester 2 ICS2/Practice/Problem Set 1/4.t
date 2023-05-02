% Variables
var birthYear : int
var currentYear : int 
var age : int

% Ask user for current year
put "Enter the current year:"
get currentYear

% Ask user for birth year
put "Enter your birth year: "
get birthYear

% Calculate age
age := currentYear - birthYear

% Output result
put "Your age in ", currentYear, " is ", age, " years old."
