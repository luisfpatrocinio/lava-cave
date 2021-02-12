/// @function				scr_EA_Set_Type(type, image, copy, optional_clear);
///	@param	{int}	type	Set the autowall type, either "Instances" or "Tiles".
///	@param	{int}	image	Set the autowall image asset to use, either a sprite index or a tileset index.
///	@param	{bool}	copy	Set whether to copy existing autowall tiles/instances to new type or not (true to copy, false to destroy)
function scr_EA_Set_Type(argument0, argument1, argument2) {

	/// @description	This script will set the autowall type, which can be either "Instances"
	///					or "Tiles". You also choose whether to copy the existing instance/tile
	///					data to the new type. If set to true, then the existing autowall data
	///					will be converted into the new type, and if set to false, then the existing 
	///					autowall data will be destroyed.

	// Initialise variables
	var _type = argument0;
	var _image = argument1;
	var _copy = argument2;

	// Check the given type is not the same as the current type
	if _type != scr_EA_Get_Type()
	{
	var _tm = scr_EA_Get_Tilemap();
	var _sz = scr_EA_Get_Size();
	var _layer = scr_EA_Get_Layer();
	// Check the given type and act accordingly
	if _type == "Instances"
		{
		// Check to see if a tilemap actually exists
		if layer_tilemap_exists(_layer, _tm)
			{
			// Check for copying any tiles into instances
			if _copy == true
				{
				// Remove any existing autowall instances
				if instance_exists(obj_EA_Wall_Parent)
					{
					with (obj_EA_Wall_Parent) instance_destroy();
					}
				// Loop through the tilemap cells and check if any are greater than 0
				var _tw = tilemap_get_width(_tm);
				var _th = tilemap_get_height(_tm);
				for (var j = 0; j < _th; ++j;)
					{
					for (var i = 0; i < _tw; ++i;)
						{
						var _td = tilemap_get(_tm, i, j);
						if _td > 0
							{
							// Tile is occupied so convert to an instance
							with (instance_create_layer(i * _sz, j * _sz, _layer, obj_EA_Wall_Parent))
								{
								image_speed = 0;
								image_index = _td;
								sprite_index = _image;
								global.EA_Grid[# i, j] = id;
								}
							}
						}
					}
				}
			// Remove the tilemap from the layer
			layer_tilemap_destroy(_tm);
			}
		scr_EA_Log("scr_EA_Set_Type - Type changed to Instances.");
		// Set globals
		global.EA_Type = _type;
		global.EA_Image = _image;
		return true;
		}
	else if _type == "Tiles"
		{
		// Remove the current tilemap.
		if layer_tilemap_exists(_layer, _tm)
			{
			layer_tilemap_destroy(_tm);
			}
		// Create a new tilemap
		_tm = layer_tilemap_create(_layer, 0, 0, _image, _sz, _sz);
		// Check for copying any tiles into instances
		if _copy == true
			{
			// Loop through all instances and set the appropriate tile
			with (obj_EA_Wall_Parent)
				{
				tilemap_set_at_pixel(_tm, image_index, x, y);
				global.EA_Grid[# x div global.EA_Size, y div global.EA_Size] = image_index;
				}
			}
		// Remove the instances from the room
		with (obj_EA_Wall_Parent)
			{
			instance_destroy();
			}
		scr_EA_Log("scr_EA_Set_Type - Type changed to Tiles.");
		// Set globals
		global.EA_Type = _type;
		global.EA_Image = _image;
		global.EA_Tilemap = _tm;
		return true;
		}
	else
		{
		scr_EA_Log("scr_EA_Set_Type - ERROR! Invalid autowall type given " + string(_type) + ".");
		}
	}
	else
	{
	scr_EA_Log("scr_EA_Set_Type - Warning! Given autowall type is already set (" + _type + ".");
	}

	return false;


}
