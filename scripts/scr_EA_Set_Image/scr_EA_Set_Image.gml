/// @function				scr_EA_Set_Image(image);
///	@param	{int}	image	The image asset to use, either a tileset index or a sprite index.
function scr_EA_Set_Image(argument0) {

	/// @description	This script will set the current autowall image asset, either
	///					a tileset index or a sprite index. Note that if you supply an
	///					asset type that is not appropriate for the autowall type then 
	///					nothing will change and an error will be output to the console.

	var _error = false;

	// Check current type
	if global.EA_Type == "Instances"
	{
	// Check the sprite is valid
	if sprite_exists(argument0)
		{
		// Set the sprite index
		global.EA_Image = argument0;
		with (obj_EA_Wall_Parent)
			{
			sprite_index = global.EA_Image;
			}
		}
	else _error = true;
	}
	else
	{
	// Check the tilset is valid
	if tileset_get_name(argument0) != ""
		{
		// Set the tileset to the tilemap
		global.EA_Image = argument0;
		tilemap_tileset(global.EA_Tilemap, global.EA_Image);
		}
	else _error = true;
	}

	if _error
	{
	scr_EA_Log("scr_EA_Set_Image - ERROR! Invalid image asset given for autowall type (" + global.EA_Type + ").");
	return false;
	}
	else
	{
	scr_EA_Log("scr_EA_Set_Image - Image changed.");
	return true;
	}


}
