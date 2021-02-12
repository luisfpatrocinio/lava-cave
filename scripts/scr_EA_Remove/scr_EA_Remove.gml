/// @function			scr_EA_Remove(x, y);
///	@param	{real}	x	The X position to delete the autowall instance/tile from
///	@param	{real}	y	The y position to delete the autowall instance/tile from
function scr_EA_Remove(argument0, argument1) {

	/// @description	This script can be used to remove an instance or a tile from the autowall
	///					layer. It will adapt all the surrounding autowall instances/tiles to 
	///					correctly adapt to the space created.

	// Initialise vars
	var _sz = global.EA_Size;
	var _grid = global.EA_Grid;
	var _cellx = (argument0 div _sz);
	var _celly = (argument1 div _sz);
	var _x = _cellx * _sz;
	var _y = _celly * _sz;
	var _rw = (room_width div _sz);
	var _rh = (room_height div _sz)

	// Check if given position is within the room bounds
	if _cellx < 0 || _cellx > _rw - 1 || _celly < 0 || _celly > _rh - 1
	{
	scr_EA_Log("scr_EA_Remove - ERROR! Cell position outside of autowall bounds.");
	}
	else
	{
	// Remove an instance or a tile to the given position cell based on the current autowall "type"
	switch(global.EA_Type)
		{
		case "Instances":
			// Check and see if an instance occupies the cell
			var _inst = instance_position(_x, _y, obj_EA_Wall_Parent);
			if instance_exists(_inst)
				{
				// Destroy the instance
				instance_destroy(_inst);
				// Reset the autowall DS grid
				_grid[# _cellx, _celly] = 0;
				var _tx = _x - _sz;
				var _ty = _y - _sz;
				// Loop through the area around the cell and set autwalls
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
			// Get the tilemap
			var _tm = global.EA_Tilemap;
			var _tx = _x - _sz;
			var _ty = _y - _sz;
			// Set the tilemap at the removed cell position
			tilemap_set(_tm, 0, _cellx, _celly);
			// Reset the autowall DS grid
			_grid[# _cellx, _celly] = 0;
			// Loop through the area around the cell and set autwalls
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
			break;
		}
	}


}
