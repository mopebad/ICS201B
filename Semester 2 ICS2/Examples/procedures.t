
% - procedures
% Declare Varaiables
var ready : string(1)
%%% SUBPROGRAMS %%%
procedure readyToContinue ()
    loop
	put "ready to continue? (y/n)" ..
	get ready
	exit when ready = "y"
    end loop
end readyToContinue

%%% MAIN PROGRAM %%%
% Procedures are used to repeat code easily. 
put "The program is beginning..."
readyToContinue()


put "The program is still running..."
readyToContinue()

put "The program is finished!"


