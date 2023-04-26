%Module 3 Part 3
%How do strings work!
var word:string
var LengthWord:int
var LocateSymbol:int

word:="123!#& Pneumonoultramicroscopicsilicovolcanoconiosis"
LengthWord:=length(word)
LocateSymbol:=index(word,"t")

put "The word is ",LengthWord, " characters."
%Will tell me how long the string is 
put "The symbol 't' shows up ", LocateSymbol
%Will find the symbol in the string!%
put word(40)
%Shows me the 40th symbol in the string
put word(40..45)
%Shows me the 40th to 45th symbol
put word(40..*)
%Shows me the 40th symbol to the end
put word(LocateSymbol .. LengthWord)
%Shows me the first symbol that I found
%until the end of the word
%word(18 .. end of the word -52)
