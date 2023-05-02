%=,<,>,>=,<=,not+
%all possivle inequality signs

%CONDITIONAL LOOPS
%The "Aaverage Calculator Program"
put "Enter a series of Marks"
const stop:=-1
var mark:int
var count,sum:int:=0
loop
    put "What is your mark?"
    get mark
    exit when mark=stop
    count:=count+1
    sum:=sum+mark
end loop
put "Your Average Mark is ",sum/count:1:2,"%"

put 5 div 3 %Rounding DOWN to whole number no matter what
put round(5/3) %Rounds to nearest number #
put 5/3 %Normal division  

%Conditional loop #2
%The Grocery List Program
var word:string
put "Enter your grocery list "..
put "one item at a time "..
put "If you want to stop, just say so!"
loop
    get word
    exit when word="stop"
    put "Your item is: ",word
end loop
put "Happy Shopping" 


