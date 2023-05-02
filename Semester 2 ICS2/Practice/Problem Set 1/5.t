% Declare variables
var names : array 1 .. 5 of string

% Input five full names
for i : 1 .. 5
  put "Enter full name(no spaces) ", i, ": "
  get names(i)
end for

% Output the names in reverse order
put "The names in reverse order are:"
var i := 5
loop
  exit when i < 1
  put names(i)
  i := i - 1
end loop
