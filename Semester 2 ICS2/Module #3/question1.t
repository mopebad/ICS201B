% This program shows the bank balance at the end of each year
% for a total of 10 years with an initial deposit of $100 and an
% annual interest rate of 9%.

var balance : real := 100 % Initial balance of $100
var interest : int

% Loop for 10 years
for year : 1 .. 10
  put "Year ", year, ":\n"
  put "Initial balance $ ", balance, "\n"
  interest := round(balance * 0.09) % Calculate interest for the year
  put "Interest for the year ", interest:0:2, "\n"
  balance := balance + interest % Update balance for the year
  put "Balance at the end of year $ ", balance:0:2, "\n\n"
end for
