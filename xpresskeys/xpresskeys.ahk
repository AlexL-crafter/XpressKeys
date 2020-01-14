;AlexL@2019
;XpressKeys made by Alexandre Rodrigues Lopes
;http://alexcrafter.blogspot.com/
;version 2.0
;########################################################
; Global variables
;########################################################
	#SingleInstance, force			;ensures that the script only runs once. Duplicates could mess up the global variables.
	#NoEnv							;Avoids checking empty variables to see if they are environment variables
	#WinActivateForce				;Skips the gentle method of activating a window and goes straight to the forceful method.
	#InstallKeybdHook				;Forces the unconditional installation of the keyboard hook.

	SetControlDelay, 0				;Sets the delay that will occur after each control-modifying command.
	SetWinDelay, 0					;Sets the delay that will occur after each windowing command, such as WinActivate.
	SetMouseDelay,0					;Sets the delay that will occur after each mouse movement or click.
	
	global btIsPressed		;modifier variable for actions that persist until the left button is released.
							;(Mainly used for Space-key Photoshop style image drag)
	
	;---------------------------------------------------------------------------------
	;change icon
	Menu, TRAY, Icon, xpresskeys.ico
	;---------------------------------------------------------------------------------
	
	;---------------------------------------------------------------------------------
	#Include xpresskeys_tooltips_uk.txt					;tooltips for graphic buttons - editable
	;---------------------------------------------------------------------------------
	;-------------------------------------------------------------------------
	#Include xpresskeys_keyboard_vars.txt				;variables used on virtual keyboard - partially editable
														;(in case of a different keyboard configuration)
	;-------------------------------------------------------------------------

;########################################################
; Main
;########################################################
	;---------------------------------------------------------------------------------
	;show the wait panel
	splash_start()
	;---------------------------------------------------------------------------------

	;---------------------------------------------------------------------------------
	;Create the Gui, and get a variable to reference it
	global gui_id								;unique id for the gui
	global gui_on								;boolean to know if gui is on/off
	global guiKeyboard_id						;unique id for the keyboard
	global guiKeyboard_on						;boolean to know if kyboard is on/off
	
	global gui_on:=false
	global guiKeyboard_on:=false
	gui_id := Gui_maker(2)						;creates the main gui and stores its Id
	guiKeyboard_id := GuiKeyboard_maker(3)		;creates the keyboard gui and stores its Id
	;---------------------------------------------------------------------------------
	
	;---------------------------------------------------------------------------------
	;close the wait panel
	splash_stop()
	;---------------------------------------------------------------------------------
	
;########################################################
; Key Macros
;########################################################
;---------------------------------------------------------------------------------
;capslock is the trigger key to show the expresskeys menu
NumpadAdd::
	global xactive				;store the process name of the active window
	global xactive_ID			;store the unique ID of the active window
	global xactive_class		;store the classNN of the active window - not used, since many apps don't have a ClassNN
	global gui_px				;store the mouse x position before the gui is shown
	global gui_py				;store the mouse y position before the gui is shown
	
	global gui_on								;boolean to know if gui is on/off
	global guiKeyboard_on						;boolean to know if kyboard is on/off
	
	if (!gui_on)
	{
		;show the gui!
		gui_on:=true
		
		;get active window
		WinGet, xactive, ProcessName, A
		WinGet, xactive_ID, ID, A
		ControlGetFocus, xactive_class, A
		
		;get mouse position
		MouseGetPos, gui_px, gui_py
		
		;show the gui
		Gui_show(2)
		
		;show the keyboard in case it had been called before
		if(guiKeyboard_on)
		{
			GuiKeyboard_show(3)
		}
	}
	else
	{
		;Hide the gui (keyboard too).
		gui_on:=false
		
		;hide the gui
		Gui_hide(2)
		GuiKeyboard_hide(3)
	}
return
;---------------------------------------------------------------------------------

;---------------------------------------------------------------------------------
;checks when mouse button is released
;if there's a persistent key pressed down, this is the event that releases it.
;Mainly used with Space key in apps like Photoshop, where this triggers a "drag image" effect.
~LButton Up::
	
	global btIsPressed
	
	if(btIsPressed)
	{
		SendInput {%btIsPressed% up}
		btIsPressed:=""
	}
return
;---------------------------------------------------------------------------------
;---------------------------------------------------------------------------------
;checks if the mouse is clicked outside the gui
;this will automatically hide the gui
/*
~LButton::
	
	global gui_id
	global guiKeyboard_id
	
	ControlGet, MainGuiVisible, Visible,,,ahk_id %gui_id%				;get boolean of the gui visibility
	MouseGetPos,,, winId												;get window ID where the mouse clicked
	
	;if the gui is visible, test if the click was inside the gui
	if (MainGuiVisible)
	{
		if (winId != gui_id &&  winId != guiKeyboard_id)
		{
			clicked outside the gui and virtual keyboard also
			Gui_hide(2)													;hide the gui
			GuiKeyboard_hide(3)											;hide the keyboard too
		}
	}
	
return
*/
;---------------------------------------------------------------------------------

;########################################################
; functions
;########################################################
;-------------------------------------------------------------------------
#Include xpresskeys_graphicbuttons.txt									;buttons creation and handling
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
#Include xpresskeys_splash.txt											;splash image related functions
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
#Include xpresskeys_maingui.txt											;main gui creation and handling
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
#Include xpresskeys_keyboard.txt										;virtual keyboard creation and handling
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
#Include xpresskeys_actions.txt											;manages each button actions and modifiers
;-------------------------------------------------------------------------
;########################################################