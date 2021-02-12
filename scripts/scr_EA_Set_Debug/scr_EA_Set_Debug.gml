/// @function					scr_EA_set_Debug(enable);
/// @param	{bool}	enable		Enable debug mode (true or false)
function scr_EA_Set_Debug(argument0) {

	/// @description	This script will enable or disable debug mode for the autowall system.
	///					Note that this will require an object in the room that has the script
	///					"scr_EA_Draw_Debug()" in it's Draw (or Draw End) event, otherwise nothing 
	///					will happen.

	global.EA_Debug = argument0;


}
