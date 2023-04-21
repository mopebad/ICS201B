% Declare Variables
var hadPizza : boolean
var numPizza : int
var remainingPizza : int

% Ask Mr. Cardona if he had Pizza this week
put "Did you have pizza this week? (true/false): "
get hadPizza

if hadPizza then
    put "How many slices have you had so far?: "
    get numPizza
else
    put "Go, get a pizza!"
end if
% Determine if Mr. Cardona should eat more Pizza or not
if numPizza >= 7 then
    put "You should not eat any more Pizzas this week."
else
    remainingPizza := 7 - numPizza
    if remainingPizza > 0 then
	put "You can have ", remainingPizza, " more slices of Pizza this week."
    else
	put "You should not eat any more Pizzas this week."
    end if
end if


