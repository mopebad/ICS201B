setscreen ("graphics:1000;750,nobuttonbar,position:center;center,offscreenonly,")
colorback (white)
color (black)
View.Update

var Message : int
Message := Pic.FileNew ("1234.bmp")

 drawfillbox(0, 0, 1000, 100, white)
       
    Pic.Draw(Message, 508, 20, picMerge)
