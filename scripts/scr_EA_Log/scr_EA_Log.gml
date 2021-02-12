///	@function						scr_EA_Log(val);
///	@param	{real/string}	val		The value (a real or a string) to log.
function scr_EA_Log(argument0) {

	///	@description			This script is a wrapper script for the GML function
	///							show_debug_message(). You can give a string or a real 
	///							as a value, and the script will display a message in
	///							in the output console appended with an Essental Autowall
	///							identifier.

	var _val = argument0;

	if !is_string(argument0)
	{
	_val = string(_val);
	}

	show_debug_message(">>>>>>>>>> Essential Autowall: " + _val);


}
