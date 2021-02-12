///	@function						scr_EA_Load(filename);
///	param	{string}	filename	The name of the file to use WITHOUT the extension type
function scr_EA_Load(argument0) {

	///	@description		This script can be used to load in autowall data that has been saved
	///						previously using the script "scr_EA_Save()". You supply the filename
	///						to load and the script will re-create the saved autowall data on the 
	///						layer specified when you called the autowall setup script. Note that 
	///						if the layer has any autowall data on it, then this will be cleared.

	// Check the filename is valid
	if !is_string(argument0)
	{
	scr_EA_Log("scr_EA_Load - ERROR! Filename not a string.")
	return false;
	}

	// Load the aotwall data and check it appears valid
	var _fname = argument0;
	var _buff = buffer_load(_fname + ".dat");
	if !buffer_exists(_buff)
	{
	scr_EA_Log("scr_EA_Load - ERROR! Buffer could not be loaded from file.")
	return false;
	}
	else if buffer_get_size(_buff) == 0
	{
	scr_EA_Log("scr_EA_Load - ERROR! Loaded buffer is empty.")
	buffer_delete(_buff);
	return false;
	}

	// Parse the autowall data...
	var _type = "Instances";
	if buffer_read(_buff, buffer_bool) == 1
	{
	_type = "Tiles";
	}
	var _asset = buffer_read(_buff, buffer_string);
	var _size = buffer_read(_buff, buffer_s16);
	var _mode = buffer_read(_buff, buffer_s8);
	var _grid = buffer_read(_buff, buffer_string);
	buffer_delete(_buff);

	// Clear existing autowall instances
	with (obj_EA_Wall_Parent)
	{
	instance_destroy();
	}
	if layer_tilemap_exists(global.EA_Layer, global.EA_Tilemap)
	{
	layer_tilemap_destroy(global.EA_Tilemap);
	}


	// Convert parsed data into autowall values
	var _image = asset_get_index(_asset);
	var _rw = room_width div _size;
	var _rh = room_height div _size;
	var _tm = -1;
	if _type == "Tiles"
	{
	var _tm = layer_tilemap_create(global.EA_Layer, 0, 0, _image, _rw, _rh);
	}
	var _tgrid = ds_grid_create(_rw, _rh);
	ds_grid_read(_tgrid, _grid);
	for (var j = 0; j < _rh; ++j;)
	{
	for (var i = 0; i < _rw; ++i;)
		{
		if _tgrid[# i, j] != 0
			{
			if _type == "Instances"
				{
				instance_create_layer(i * _size, j * _size, global.EA_Layer, obj_EA_Wall_Parent);
				}
			else tilemap_set(_tm, 1, i, j);
			}
		}
	}
	ds_grid_destroy(_tgrid);
	if _tm != -1 global.EA_Tilemap = _tm;

	// Re-reate the saved room from the data
	return scr_EA_Setup(_mode, _type, _image, global.EA_Layer, _size);





}
