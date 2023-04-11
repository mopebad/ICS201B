
var startTime : real
var finishTime : real
var distance : real
var startTimeInMinutes : real
var finishTimeInMinutes : real
var elapsedTimeInMinutes : real
var hour : real
var elapsedTimeInHours : real
var averageSpeed : real
var minute : real
% Ask user for inputs
put "Enter the start time (in 24-hour format but with a dot e.g. 13.45): "
get startTime
put "Enter the finish time (in 24-hour format but with a dot e.g. 16.30): "
get finishTime
put "Enter the distance you traveled in kilometers: "
get distance

% Calculate speed
startTimeInMinutes := startTime * 60 + startTime
finishTimeInMinutes := finishTime * 60 + finishTime
elapsedTimeInMinutes := finishTimeInMinutes - startTimeInMinutes
elapsedTimeInHours := elapsedTimeInMinutes / 60
averageSpeed := distance / elapsedTimeInHours

% Output results

put "Your average speed was ", averageSpeed:1:2, " km/hr."
