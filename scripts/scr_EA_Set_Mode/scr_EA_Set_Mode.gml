/// @function				scr_EA_Set_Mode(mode, image, size, clear);
///	@param	{int}	mode	The autotile mode to set, either 16 or 47.
///	@param	{int}	image	The autotile image to use, either a sprite asset or a tileset asset
///	@param	{int}	size	The autotile cell size (in pixels)
///	@param	{bool}	clear	Whether to attempt to clear the existing autowall tiles (true) or not (false)
function scr_EA_Set_Mode(argument0, argument1, argument2, argument3) {

	/// @description	This script will set the autowall mode as well as the image asset used and
	///					the cell size. You can also set whether to clear the current set of autowall
	///					cells or not. When set to "false" this will attempt to change the chosen autowall
	///					image for all the tiles/istances in the room to the given image.

	// Initialise variables
	var _mode = argument0;
	var _image = argument1;
	var _size = argument2;
	var _clear = argument3;

	// Check the current mode
	if global.EA_Mode != _mode
	{
	// Check the new mode is an appropriate value
	if (_mode == 16 || _mode == 47)
		{
		// Check to see if we are clearing all the current autowall cells
		if _clear
			{
			// Check the current autowall "type" and remove the instances or tiles as required
			if global.EA_Type == "Instances"
				{
				with (obj_EA_Wall_Parent)
					{
					instance_destroy();
					}
				}
			else
				{
				layer_tilemap_destroy(global.EA_Tilemap);
				}
			}
		scr_EA_Log("scr_EA_Set_Mode - Mode changed to " + string(_mode) + ".");
		// Re-initialise the autowall scripts using the new mode and the given and current values
		return scr_EA_Setup(_mode, global.EA_Type, _image, global.EA_Layer, _size);
		}
	else
		{
		scr_EA_Log("scr_EA_Set_Mode - ERROR! Given mode " + string(_mode) + " is invalid.");
		}
	}
	else
	{
	scr_EA_Log("scr_EA_Set_Mode - Warning! Mode not changed as it is the same (currently " + string(_mode) + ").");
	}

	return false;


}
