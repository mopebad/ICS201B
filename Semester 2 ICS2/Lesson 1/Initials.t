%The "Initials" Program
%Lets Draw our Initials
loop
    put "How many houes do you want?"
    put "Pick a number between 1 -5"
    var count:int
    get count
    put repeat("*********      ********* ",count)
    put repeat("    *          *         ",count)
    put repeat("    *          *         ",count)
    put repeat("    *          *         ",count)
    put repeat("    *          *         ",count)
    put repeat("*   *          *         ",count)
    put repeat("*****          ********* ",count)
    exit
end loop


