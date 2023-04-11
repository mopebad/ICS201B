% Program to calculate the average of a series of marks
% Declare Variables

var
  numMarks, sum, mark: int
var avg : real

put "Enter the number of marks in the series: "
get numMarks

sum := 0

for i : 1 .. numMarks
    put "Enter mark ", i, ": "
    get mark
    sum := sum + mark
end for

avg := sum / numMarks

put "The average of the marks is ",avg ,"%"
