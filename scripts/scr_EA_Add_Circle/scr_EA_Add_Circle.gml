/// @function				scr_EA_Add_Circle(x, y, rad, optional_obj);
///	@param	{real}	x		The X position to add the autowall instance/tile to
///	@param	{real}	y		The y position to add the autowall instance/tile to
///	@param	{real}	rad		The radius of the circle to add in CELLS (minimum 1)
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls
function scr_EA_Add_Circle() {

	/// @description	This script can be used to add instances or tiles to a circular area around
	///					the nearest cell position to the X/Y position selected, autowalling the
	///					surrounding occupied cells. You give the X/Y position to add the autowalls
	///					to as well as the radius of the circle in autowall cells. By default, when 
	///					using instances for autowall, the instance created will be of the object 
	///					"obj_EA_Wall_Parent", but you can supply another object type to use if 
	///					required, however this MUST be a child of the object "obj_EA_Wall_Parent",
	///					otherwise the scripts won't work.

	// Initialise variables
	var _sz = global.EA_Size;
	var _grid = global.EA_Grid;
	var _rw = (room_width div _sz);
	var _rh = (room_height div _sz)
	var _rad = argument[2];
	if _rad < 1 _rad = 1;

	// Check for custom autowall object
	if argument_count > 3
	{
	var _obj = argument[3];
	}
	else var _obj = obj_EA_Wall_Parent;

	// Get the center cell position, clamped to the room width/height
	var _cellx = clamp((argument[0] div _sz), -_rad, _rw + _rad - 1);
	var _celly = clamp((argument[1] div _sz), -_rad, _rh + _rad - 1);
	// Get the total area that the circle will occupy
	var _areaw = (_rad * 2) + 1
	var _areah = _areaw;
	// Calculate the offsets from the circle origin
	var _w1 = floor(_areaw / 2);
	var _h1 = floor(_areah / 2);
	var _w2 = _areaw - _w1;
	var _h2 = _areah - _h1;
	// Calculate the top left corner of the area of the circle, clamped to the room width/height
	var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
	var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
	// Calculate the bottom right corner of the area of the circle, clamped to the room width/height
	var _areax2 = clamp(_cellx + _w2, 0, _rw);
	var _areay2 = clamp(_celly + _h2, 0, _rh);
	// Calculate the top left corner of the area to autowall, clamped to the room width/height
	var _areax3 = clamp(_areax1 - 1, 0, _rw);
	var _areay3 = clamp(_areay1 - 1, 0, _rh);
	// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
	var _areax4 = clamp(_areax2 + 1, 0, _rw);
	var _areay4 = clamp(_areay2 + 1, 0, _rh);
	// Check which "type" of autowall is being used
	switch(global.EA_Type)
	{
	case "Instances":
		var _spr = global.EA_Image;
		var _layer = global.EA_Layer;
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to create instances
		ds_grid_set_disk(_grid, _cellx, _celly, _rad, -4);
		// Loop through the area the circle occupies and create instances as required
		for (var j = _areay1; j < _areay2; ++j;)
			{
			for (var i = _areax1; i < _areax2; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					var _inst = instance_position(_tx, _ty, obj_EA_Wall_Parent);
					if !_inst
						{
						with (instance_create_layer(_tx, _ty, _layer, _obj))
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					else
						{
						with (_inst)
							{
							image_speed = 0;
							sprite_index = _spr;
							_grid[# i, j] = id;
							}
						}
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				with (instance_position(i * _sz, j * _sz, obj_EA_Wall_Parent))
					{
					image_index = scr_EA_Autowall(x, y);
					}
				}
			}
		break;
	case "Tiles":
		// Get the tilemap for the autowall tiles
		var _tm = global.EA_Tilemap;
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to set the tiles
		ds_grid_set_disk(_grid, _cellx, _celly, _rad, -4);
		// Loop through the area the circle occupies and set tiles as required
		for (var j = _areay1; j < _areay2; ++j;)
			{
			for (var i = _areax1; i < _areax2; ++i;)
				{
				if _grid[# i, j] == -4
					{
					tilemap_set(_tm, 1, i, j);
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				var _tl = tilemap_get(_tm, i, j);
				if _tl != 0
					{
					var _tl = scr_EA_Autowall((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				}
			}
		break;
	}


}
