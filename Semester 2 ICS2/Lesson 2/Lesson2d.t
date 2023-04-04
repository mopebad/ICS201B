%COUNTED LOOP WITH CONDITIONAL EXITS
%Taking the old gorcery list program  

var word:string
put "Enter your Grocery list"
put "Say stop to exit"
put "You can only enter 10 items at most
for count:1..10
    put "What is your item
    get word
    exit when word="stop"
end for
