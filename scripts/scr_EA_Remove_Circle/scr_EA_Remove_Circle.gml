/// @function				scr_EA_Remove_Circle(x, y, rad);
///	@param	{real}	x		The X position to remove the autowall instance/tile from
///	@param	{real}	y		The y position to remove the autowall instance/tile from
///	@param	{real}	rad		The radius of the circle to remove in CELLS (minimum 1)
function scr_EA_Remove_Circle() {

	/// @description	This script can be used to remove instances or tiles from a circular area around
	///					the nearest cell position to the X/Y position selected, autowalling the
	///					surrounding occupied cells. You give the X/Y position to add the autowalls
	///					to as well as the radius of the circle in autowall cells.

	// Initialise variables
	var _sz = global.EA_Size;
	var _grid = global.EA_Grid;
	var _rw = (room_width div _sz);
	var _rh = (room_height div _sz)
	var _rad = argument[2];
	if _rad < 1 _rad = 1;

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
	var _areax2 = clamp(_cellx + _w2 - 1, 0, _rw);
	var _areay2 = clamp(_celly + _h2 - 1, 0, _rh);
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
		// Use the DS grid functions to set the autowall grid to -4 in the circular area defined
		// This will then be used to decide where to remove the instances from
		ds_grid_set_disk(_grid, _cellx, _celly, _rad, -4);
		// Loop through the area the circle occupies and remove instances as required
		for (var j = _areay3; j < _areay4; ++j;)
			{
			for (var i = _areax3; i < _areax4; ++i;)
				{
				if _grid[# i, j] == -4
					{
					var _tx = i * _sz;
					var _ty = j * _sz;
					with (instance_position(_tx, _ty, obj_EA_Wall_Parent))
						{
						instance_destroy();
						}
					_grid[# i, j] = 0;
					}
				}
			}
		// Loop through the autowall area and autowall all remaining occupied cells
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
		// Use the DS grid functions to set the autowall grid to 0 in the circular area defined
		ds_grid_set_disk(_grid, _cellx, _celly, _rad, 0);
		// Loop through the area the circle occupies and set tiles as required
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
