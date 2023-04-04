%COUNTED LOOPS
%The "Aaverage Calculator Program"
put "Enter a series of Marks"
var mark : int
var sum : int := 0
const numMarks := 4
put "You can only enter ", numMarks, " marks"

for count : 1 .. numMarks
    put "This is mark #",count
    get mark
    sum:=sum+mark
end for
put "Your Average Mark is ", round(sum/numMarks) : 1 : 2, "%"

%We change the [for count:1..numMarks]
%We can directly put a number
%For example for count:1..10
%This will do the function, 10 times
for decreasing count:5..1
%This will count DOWN from 5 to 1
for count:1..10 by 2
%This will count UP from 1 to 10 by 2s
