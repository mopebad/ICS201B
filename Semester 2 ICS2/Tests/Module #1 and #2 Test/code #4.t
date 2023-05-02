var resp : string (1)
var bags : string (1)

put "Did you go to bed on time?(y/n)"
get resp

if resp = "y" then
    put "Did you prepare your bags the night before?(y/n)"
    get bags

    if bags = "y" then
	put "You will be on time!"
    else
	put "You might be a little late!"
    end if
else
    put "You have to sleep earlier!"
end if





