var name : string
var age : real
var is_adult : boolean




put "what is your name?"
get name :*
put "What is your age?"
get age
is_adult := age > 18
if age < 0 
then put "No cuh thats not possible you dumbass"
return
end if 
put "Hello ",name, " you are ",age, " years old and it is ",is_adult," that you are an adult."
