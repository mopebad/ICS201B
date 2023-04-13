%YOUR TASK! A NESTED IF CONDITION
%Bad students DONT STUDY
%Good students DO study but DONT pay attention
%Great students do study, do pay attention but DONT ask questions
%Excelletn students do ALL of the above
var in2 : string := "n"
var in1 : string := "n"
var in3 : string := "n"

put "Do you study? y or n"
get in1

if in1 = "n" then
    put "You are a bad student!"
else
    put "Do you pay attention in class? y or n"
    get in2

    if in2 = "n" then
	put "You are a good student!"
    else
	put "Do you pay attention but don't ask questions? y or n"
	get in3

	if in3 = "n" then
	    put "You are a great student!"
	else
	    put "You are an excellent student!"
	end if

    end if

end if
