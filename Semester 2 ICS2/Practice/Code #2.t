var
    numRatings, sum, rating : int
var avg : real

put "Enter the number of ratings in the series: "
get numRatings

sum := 0

for i : 1 .. numRatings
    put "Enter rating ", i, ":(from 1-10)"
    get rating
    sum := sum + rating
end for

avg := sum / numRatings

put "The average of the ratings is ", round(avg), " out of 10" 
