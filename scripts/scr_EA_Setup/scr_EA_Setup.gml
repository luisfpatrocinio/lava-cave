/// @function					scr_EA_Setup(mode, type, image, layer, size);
/// @param	{int}	mode		The autowall mode to use, either 16 or 47
/// @param	{int}	type		The autowall type, either "Instances" or "Tiles"
/// @param	{int}	image		The image resource to use, either a sprite or a tileset (depending on the "type" argument set)
/// @param	{int}	layer		The layer to create the autowalls on
/// @param	{int}	size		The size of each tile in the sprite or tileset.
function scr_EA_Setup(argument0, argument1, argument2, argument3, argument4) {

	/// @description	This script will initialise the essential autowall scripts in a room, and 
	///					should be called when a room with autowall features is started, before calling
	///					any other autowall scripts.
	///
	///					The script will set the autowall mode (either 16 or 47) and the wall type 
	///					(either "instances" or "tiles") and you need to supply a sprite or tileset 
	///					asset that has been correctly formatted (ie: all tiles/sub-images must be 
	///					square and follow the order of the template sprites included with this asset).
	///					You also need to supply the layer to create the autoall instances/tiles on.
	///					Note that if the layer does not exist, then the layer that the instance running
	///					the setup code is on will be used, and if the layer does not have a tilemap 
	///					assigned to it (and the type is "Tiles"), then one will be created. Finally,
	///					you need to give the size (in pixels) of the individual autowall cell.

	// Initialise autowall cell size
	global.EA_Size = argument4;

	// Check the mode
	if argument0 != 16 && argument0 != 47
	{
	scr_EA_Log("scr_EA_Setup - ERROR! Script cannot be initialised with mode other than 16 or 47.");
	return -1;
	}
	global.EA_Mode = argument0;

	// Check the type
	if argument1 != "Instances" && argument1 != "Tiles"
	{
	scr_EA_Log("scr_EA_Setup - ERROR! Script cannot be initialised with type other than Instances or Tiles.");
	return -1;
	}
	global.EA_Type = argument1;

	// Check whether a sprite or a tileset has been given
	if !sprite_exists(argument2)
	{
	if tileset_get_name(argument2) == ""
		{
		scr_EA_Log("scr_EA_Setup - ERROR! Given sprite or tileset does not exist.");
		return -1;
		}
	}
	if global.EA_Type == "Instances"
	{
	if !sprite_exists(argument2)
		{
		scr_EA_Log("scr_EA_Setup - ERROR! Initialisation type is given as Instances but a tileset asset has been supplied.");
		return -1;
		}
	}
	else
	{
	if tileset_get_name(argument2) == ""
		{
		scr_EA_Log("scr_EA_Setup - ERROR! Initialisation type is given as Tiles but a sprite asset has been supplied.");
		return -1;
		}
	}
	// Set the image to be used
	global.EA_Image = argument2;

	// Check the layer given
	var _l = argument3;
	if is_string(_l)
	{
	_l = layer_get_id(_l);
	}
	if !layer_exists(_l)
	{
	global.EA_Layer = layer;
	scr_EA_Log("scr_EA_Setup - WARNING! Given layer ID does not exist. Defaulting to controller instance layer.")
	}
	else
	{
	global.EA_Layer = _l;
	}

	// Check the tilemap exists and create one if it doesn't
	if global.EA_Type == "Tiles"
	{
	var _tm = -1;
	var _elements = layer_get_all_elements(global.EA_Layer);
	for (var i = 0; i < array_length_1d(_elements); i++;)
	   {
	   if layer_get_element_type(_elements[i]) == layerelementtype_tilemap
	      {
	      _tm = _elements[i];
		  break;
	      }
	   }
	if !layer_tilemap_exists(_l, _tm)
		{
		global.EA_Tilemap = layer_tilemap_create(_l, 0, 0, global.EA_Image, room_width div global.EA_Size, room_height div global.EA_Size);
		scr_EA_Log("scr_EA_Setup - WARNING! Layer has no tilemap assigned to it. Creating new tilemap."); 
		}
	else global.EA_Tilemap = _tm;
	}

	// Initialise any existing autowall instances or tiles in the room, depending on the given "type"
	switch(global.EA_Type)
	{
	case "Instances":
		with (obj_EA_Wall_Parent)
			{
			sprite_index = global.EA_Image;
			image_speed = 0;
			image_index = scr_EA_Autowall(x, y);
			}
		scr_EA_Log("scr_EA_Setup - Existing Instances Initialised.");
		break;
	case "Tiles":
		var _tw = tilemap_get_width(global.EA_Tilemap);
		var _th = tilemap_get_height(global.EA_Tilemap);
		var _tm = global.EA_Tilemap;
		var _sz = global.EA_Size;
		tilemap_tileset(global.EA_Tilemap, global.EA_Image);
		var _index = 0;
		for (var j = 0; j < _th; ++j;)
			{
			for (var i = 0; i < _tw; ++i;)
				{
				if tilemap_get(_tm, i, j) > 0
					{
					_index = scr_EA_Autowall(i * _sz, j * _sz);
					tilemap_set(_tm, _index, i, j);
					}
				}
			}
		scr_EA_Log("scr_EA_Setup - Existing Tiles Initialised.");
		break;
	}

	// Store appropriate values in the autowall grid
	// Initialise variables
	var _sz = global.EA_Size;
	var _tm = global.EA_Tilemap;
	var _gw = room_width div _sz;
	var _gh = room_height div _sz;

	// Check for previous iterations of the grid and remove if found
	if ds_exists(global.EA_Grid, ds_type_grid)
	{
	// Destroy old grid
	ds_grid_destroy(global.EA_Grid);
	}

	// Create new grid and clear it
	global.EA_Grid = ds_grid_create(_gw, _gh);
	ds_grid_clear(global.EA_Grid, 0);


	// Populate grid based on autowall tiles/instances
	switch(global.EA_Type)
	{
	case "Instances":
		with (obj_EA_Wall_Parent)
			{
			global.EA_Grid[# x div _sz, y div _sz] = id;
			}
		break;
	case "Tiles":
		for (var j = 0; j < _gh; ++j;)
			{
			for (var i = 0; i < _gw; ++i;)
				{
				var _index = tilemap_get(_tm, i, j);
				if _index > 0
					{
					global.EA_Grid[# i, j] = _index;
					}
				}
			}
		break;
	}

	// Finish
	scr_EA_Log("scr_EA_Setup - Autowall Initialised.");
	return true;


}
