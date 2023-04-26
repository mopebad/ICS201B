%Module 3 Part 4
%NESTED LOOPS

var numRows : int
var numCols : int

put "How many rows do you want? " ..
get numRows

put "How many columns do you want? " ..
get numCols

for i : 1 .. numRows
    %this program will run 5 times
    for j : 1 .. numCols
	%this will run 8 times on its own
	put "*" ..
    end for
    put i
end for


