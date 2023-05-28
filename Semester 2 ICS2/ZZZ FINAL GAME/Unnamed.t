 
setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (black)
color (black)
View.Update


var Message2 : int
Message2 := Pic.FileNew ("message2.bmp")

cls
drawfillbox(0, 750, 1000, 650, white)
Pic.Draw(Message2, 192, 650, picMerge)
View.Update



proc endscreen
    cls 
    Pic.Draw (win, 0, 0, picCopy)
    View.Update
end endscreen

proc deathscreen
    cls
    Pic.Draw (death, 0, 0, picCopy)
    View.Update
end deathscreen

var death : int
death := Pic.FileNew ("death.bmp")

var win : int
win := Pic.FileNew ("win.bmp")
