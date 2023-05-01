%Module 4 Part 4
%Rainbow Colors!

%All colors down horizontally
for row:1..255
    colorback(row)
    put " "
    delay(500)
end for

%All colors (First 80) vertically across
for row:1..25
    for column:1..80
	colorback(column)
	locate(row,column)
	put " "
    end for
end for
