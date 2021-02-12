/// @function				scr_EA_Add(x, y, [obj]);
///	@param	{real}	x		The X position to add the autowall instance/tile to
///	@param	{real}	y		The y position to add the autowall instance/tile to
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls
function scr_EA_Add() {

	/// @description	This script can be used to add an instance or a tile to the autowall
	///					layer. It will adapt all the surrounding autowall instances/tiles to 
	///					correctly merge with the new one. By default, when using instances for
	///					autowall, the instance created will be of the object "obj_EA_Wall_Parent",
	///					but you can supply another object type to use if required, however this
	///					MUST be a child of the object "obj_EA_Wall_Parent", otherwise the scripts
	///					won't work.

	// Initialise vars
	var _sz = global.EA_Size;
	var _rw = (room_width div _sz);
	var _rh = (room_height div _sz)
	var _cellx = clamp(argument[0] div _sz, 0, _rw);
	var _celly = clamp(argument[1] div _sz, 0, _rh);
	var _x = _cellx * _sz;
	var _y = _celly * _sz;

	// Check for custom object
	if argument_count > 2
	{
	var _obj = argument[2];
	}
	else var _obj = obj_EA_Wall_Parent;

	// Check if given position is within the room bounds
	if _cellx < 0 || _cellx > _rw - 1 || _celly < 0 || _celly > _rh - 1
	{
	scr_EA_Log("scr_EA_Add - ERROR! Cell position outside of autowall bounds.");
	}
	else
	{
	// Add an instance or a tile to the given position cell based on the current autowall "type"
	switch(global.EA_Type)
		{
		case "Instances":
			// Check no instance currently occupies the position
			if !instance_position(_x, _y, obj_EA_Wall_Parent)
				{
				// Create instance
				var _inst = instance_create_layer(_x, _y, global.EA_Layer, _obj);
				var _tx = _x - _sz;
				var _ty = _y - _sz;
				// Set the autowall cell DS grid
				with (_inst)
					{
					image_speed = 0;
					sprite_index = global.EA_Image;
					global.EA_Grid[# _cellx, _celly] = id;
					}
				// Loop through the area around the given cell position and autowall instances
				for (var j = 0; j < 3; ++j;)
					{
					for (var i = 0; i < 3; ++i;)
						{
						with (instance_position(_tx + (i * _sz), _ty + (j * _sz), obj_EA_Wall_Parent))
							{
							image_index = scr_EA_Autowall(x, y);
							}
						}
					}
				}
			break;
		case "Tiles":
			// Get the autowall tilemap ID
			var _tm = global.EA_Tilemap;
			var _tx = _x - _sz;
			var _ty = _y - _sz;
			// Set the given tilemap cell to a value greater than 0 so it's detected in the subsequent loop
			tilemap_set(_tm, 1, _cellx, _celly);
			// Loop through the area around the given cell position and autowall the tiles
			for (var j = 0; j < 3; ++j;)
				{
				for (var i = 0; i < 3; ++i;)
					{
					var _tl = tilemap_get(_tm, _cellx - 1 + i, _celly - 1 + j);
					if _tl != 0
						{
						var _tl = scr_EA_Autowall(_tx + (i * _sz), _ty + (j * _sz));
						tilemap_set(_tm, _tl, _cellx - 1 + i, _celly - 1 + j);
						}
					}
				}
			// Set the autowall cell DS grid
			global.EA_Grid[# _cellx, _celly] = tilemap_get(_tm, _cellx, _celly);
			break;
		}
	}


}
