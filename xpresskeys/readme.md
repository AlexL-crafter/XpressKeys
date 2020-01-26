#
# XpressKeys 

Made by Alexandre Rodrigues Lopes [http://alexcrafter.blogspot.com/](http://alexcrafter.blogspot.com/)

version 3.0

![screenshot](screenshot.png)

#
# Intro

Hello mates!

This autohotkey script creates a handy Gui with graphic buttons that simulate the most used actions in any art software.

It was made with the purpose of reducing the need of a keyboard when working with digital tablets.

Things like changing from brush to eraser, to fill bucket, drag and zoom, and so on, become much more faster and intuitive.

You just have to match your specific software shortcuts for these actions with the hotkey commands sent by the gui.

#
# Install

Make sure you have [AutoHotkey](https://www.autohotkey.com/) installed for Windows.

Download this repository, and run `xpresskeys.ahk`. Trigger the GUI by pressing the `+` on your keyboard's numpad (NumpadPlus).

#
# Extras

There's a button that activates a virtual Keyboard.

It includes some compound keys, like accent and tilde effects on vowels, for latin languages.

The codes were developed from a QWERTY European Portuguese keyboard, so, if you need different symbols, you'll have to use the "key history panel" of Autohotkey to get your correct key codes.

The Xpress Typer was added - See `Changelog` for version 3.0

#
# Customization

`xpresskeys_tooltips_uk.txt` - Has all the labels in english for each button. You can change these, add more, or even make your own file with another language.

Just don't forget to change the line
```
#Include xpresskeys_tooltips_uk.txt
```
in the script `xpresskeys.ahk`

`xpresskeys_actions.txt` - Here you can change/add more button actions. The button id MUST match one created in the file `xpresskeys_buttons.txt`

So, if you add another button with the id `btfoo`:
```
AddImgButton(n,175,80,50,50,"btfoo","bt_foo_up.png","bt_foo_on.png","bt_foo_dn.png")
```
in the file `xpresskeys_buttons.txt`
just add another case for it in the file `xpresskeys_actions.txt`
like this:
```
	Case "btfoo":
	Gui_hide(A_Gui)	;hide the gui on mouse click
	SendInput {d}	;The shortcut sent to the art window (must match that program's shortcut key)
```
NOTE: you will need three png images for the button, with up/over/down states, place them inside the "images" folder, and properly add their filenames to the command line.
(in this case; `"bt_foo_up.png","bt_foo_on.png","bt_foo_dn.png"`)

`xpresskeys_keyboard_vars.txt` - Has all the codes used for the virtual keyboard.

#
# Changelog

## version 3.0
Some applications, as well as the windows explorer, will immediately close a text input when focus is lost. This makes using the express keyboard useless when trying to type text in there, or simple things like changing a file's name or editing a layer's name in photoshop.

A new feature was introduced: the Xpress Typer!
An input text box was added to the keyboard, and is activated by pressing the key `Typer`. When this input box is active, all keyboard keys divert their commands into it, instead of sending them to the target window.

While the input box is active, if you go to the target window and open any text area, you just have to press `middle mouse button` to transfer the text from the Xpress input box into the text area you want to edit.

NOTE: this method requires a pen with three buttons (one assigned to simulate middle mouse button), or a custom button in the display tablet that can be assigned to it.

The middle mouse button was chosen because it's the least intrusive while working with art software. Most of the times, it is only used to drag the canvas around.


## version 2.0

This version was modified to trigger the graphical Menu when pressing the Key "NumpadPlus".

Some display tablets and Art software do not allow the assignment of "Capslock" key.

Drag function was made to both the Main Gui and the Keyboard, for better visibility and functionality.

Restoring mouse position after the Gui is hidden was removed.

## version 1.0

Initial release.

#
# 

Hope you like it.

Have fun!

AlexL.
