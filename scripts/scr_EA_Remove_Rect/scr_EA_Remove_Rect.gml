/// @function				scr_EA_Remove_Rect(x, y, width, height);
///	@param	{real}	x		The X position to add the autowall instance/tile to
///	@param	{real}	y		The y position to add the autowall instance/tile to
///	@param	{real}	width	The width of the rectangle to set in CELLS
///	@param	{real}	height	The height of the rectangle to set in CELLS
///	@param	{int}	obj		OPTIONAL! The object to use for instance-based autowalls
function scr_EA_Remove_Rect() {

	/// @description	This script can be used to remove instances or tiles from a rectangular area around
	///					the nearest cell position to the X/Y position selected, autowalling the
	///					surrounding occupied cells. You give the X/Y position to add the autowalls
	///					to as well as the width and height of the area to remove.

	// Initialise variables
	var _sz = global.EA_Size;
	var _grid = global.EA_Grid;
	var _cellx = (argument[0] div _sz);
	var _celly = (argument[1] div _sz);
	var _rw = (room_width div _sz);
	var _rh = (room_height div _sz)

	// Get the area that the rectangle will occupy
	var _areaw = floor(argument[2]);
	var _areah = floor(argument[3]);
	// Modify the center cell position based on the size of the rectangle
	if _areaw div 2 == 0 && _areaw != 1 _cellx += 1;
	if _areah div 2 == 0 && _areah != 1 _celly += 1;
	// Calculate offsets for clamping the area
	var _w1 = floor(_areaw / 2);
	var _h1 = floor(_areah / 2);
	var _w2 = _areaw - _w1;
	var _h2 = _areah - _h1;
	// Calculate the top left corner of the area of the rectangle, clamped to the room width/height
	var _areax1 = clamp(_cellx - _w1, 0, _rw - 1);
	var _areay1 = clamp(_celly - _h1, 0, _rh - 1);
	// Calculate the bottom right corner of the area of the rectangle, clamped to the room width/height
	var _areax2 = clamp(_cellx + _w2 - 1, 0, _rw - 1);
	var _areay2 = clamp(_celly + _h2 - 1, 0, _rh - 1);
	// Calculate the top left corner of the area to autowall, clamped to the room width/height
	var _areax3 = clamp(_areax1 - 1, 0, _rw);
	var _areay3 = clamp(_areay1 - 1, 0, _rh);
	// Calculate the bottom right corner of the area to autowall, clamped to the room width/height
	var _areax4 = clamp(_areax2 + 2, 0, _rw);
	var _areay4 = clamp(_areay2 + 2, 0, _rh);
	// Check which "type" of autowall is being used
	switch(global.EA_Type)
	{
	case "Instances":
		// Use the DS grid functions to set the autowall grid to -4 in the rectangular area defined
		// This will then be used to decide where to remove instances
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, -4);
		// Loop through the area the rectangle occupies and remove instances as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					var _inst = instance_position(_tx, _ty, obj_EA_Wall_Parent);
					if _inst
						{
						with (_inst)
							{
							instance_destroy();
							}
						}
					_grid[# i, j] = 0;
					}
				}
			}
		// Loop through the autowall area and autowall all occupied cells after the removal
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
		// Use the DS grid functions to set the autowall grid to 0 in the rectangular area defined
		ds_grid_set_region(_grid, _areax1, _areay1, _areax2, _areay2, 0);
		// Loop through the area the rectangle occupies and set tiles as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] != 0
					{
					var _tl = scr_EA_Autowall((i * _sz), (j * _sz));
					tilemap_set(_tm, _tl, i, j);
					_grid[# i, j] = _tl;
					}
				else tilemap_set(_tm, 0, i, j);
				}
			}
		break;
	}


}
