% Constants
const CM_PER_INCH : real := 2.54

% Variables
var deskLengthInInches : real
var deskLengthInCentimeters : real

% Prompt user for desk length in inches
put "Enter the length of the desk in inches: "
get deskLengthInInches

% Convert inches to centimeters
deskLengthInCentimeters := deskLengthInInches * CM_PER_INCH

% Output result
put "The length of the desk is ", deskLengthInCentimeters, " cm."
