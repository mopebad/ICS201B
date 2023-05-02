var radius, area:real 
const pi:=3.14159

% Calculate the area of a circle with radius 10m
put "Please enter 10 as the radius."
get radius
area:=pi*radius**2
put "The Area is ",area:1:2, "m2"


% Calculate the annual interest payable on a loan of $5365.25 at 12.5%
var loan, interestamount:real
const interest:=0.125
put "Please enter 5365.25 as your loan amount"
get loan
interestamount := loan*interest
put "The loan goes up by ",interestamount," every year"


% Calculate the sales tax of a purchase of $14.50 at 13%
const tax := 0.13
var amount : real
var total : real
put "Enter 14.50 for your new purchase"
get amount
total:=amount*tax
put "The sales tax of your item is ",total;
