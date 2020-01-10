XpressKeys made by Alexandre Rodrigues Lopes
http://alexcrafter.blogspot.com/
version 2.0
-----------------------------Intro-------------------------------------
Hello mates!
This autohotkey script creates a handy Gui with graphic buttons that simulate the most used actions in any art software.
It was made with the purpose of reducing the need of a keyboard when working with digital tablets.
Things like changing from brush to eraser, to fill bucket, drag and zoom, and so on, become much more faster and intuitive.
------------------------------------------------------------------
You just have to match your specific software shortcuts for these actions with the hotkey commands sent by the gui.
------------------------------------------------------------------

------------------------------------------------------------------
Extras:
------------------------------------------------------------------
There's a button that activates a virtual Keyboard.
It includes some compound keys, like accent and tilde effects on vowels, for latin languages.
The codes were developed from a QWERTY European Portuguese keyboard, so, if you need different symbols, you'll have to use the "key history panel" of Autohotkey to get your correct key codes.

------------------------------------------------------------------
Files to manipulate:
------------------------------------------------------------------
"xpresskeys_tooltips_uk.txt" -Has all the labels in english for each button. You can change these, add more, or even make your own file with another language.
Just don't forget to change the line
#Include xpresskeys_tooltips_uk.txt
in the script "xpresskeys.ahk"

"xpresskeys_actions.txt" -Here you can change/add more button actions. The button id MUST match one created in the file "xpresskeys_buttons.txt"

So, if you add another button with the id "btfoo":
-----
AddImgButton(n,175,80,50,50,"btfoo","bt_foo_up.png","bt_foo_on.png","bt_foo_dn.png")
-----
in the file "xpresskeys_buttons.txt"
just add another case for it in the file "xpresskeys_actions.txt"
like this:
-----
	Case "btfoo":
	Gui_hide(A_Gui)	;hide the gui on mouse click
	SendInput {d}	;The shortcut sent to the art window (must match that program's shortcut key)
-----	
NOTE: you will need three png images for the button, with up/over/down states, place them inside the "images" folder, and properly add their filenames to the command line.
(in this case; "bt_foo_up.png","bt_foo_on.png","bt_foo_dn.png")
-----
"xpresskeys_keyboard_vars.txt" file has all the codes used for the virtual keyboard.
------------------------------------------------------------------

Hope you like it.
Have fun!
AlexL.
