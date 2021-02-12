/// @function			scr_EA_Clear();
function scr_EA_Clear() {

	/// @description	This script can be used to clear all autowall tiles or instances
	///					from the current room.

	// Check autowall "type" and remove the instances or reset the tiles as required
	switch(global.EA_Type)
	{
	case "Instances":
		with (obj_EA_Wall_Parent)
			{
			instance_destroy();
			}
		break;
	case "Tiles":
		if layer_tilemap_exists(global.EA_Layer, global.EA_Tilemap)
			{
			layer_tilemap_destroy(global.EA_Tilemap);
			}
		global.EA_Tilemap = layer_tilemap_create(global.EA_Layer, 0, 0, global.EA_Image, global.EA_Size, global.EA_Size);
		break;
	}

	// Reset the autowall DS Grid
	var _gw = room_width div global.EA_Size;
	var _gh = room_height div global.EA_Size;
	if ds_exists(global.EA_Grid, ds_type_grid)
	{
	ds_grid_destroy(global.EA_Grid);
	}
	global.EA_Grid = ds_grid_create(_gw, _gh);
	ds_grid_clear(global.EA_Grid, 0);

	scr_EA_Log("scr_EA_Clear - Autowall sprites/tiles cleared.");
	return true;


}
