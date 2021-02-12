///	@function						scr_EA_Save(filename);
///	param	{string}	filename	The name of the file to use WITHOUT the extension type
function scr_EA_Save(argument0) {

	///	@description		This script can be used to save out the autowall setup of the
	///						current room. Simply give the filename to use and all the relevant
	///						autowall data will be saved to the file, ready to be loaded back
	///						into the game using the "scr_EA_Load()" script.

	// Check filename is valid
	if !is_string(argument0)
	{
	scr_EA_Log("scr_EA_Save - ERROR! Filename not a string.")
	return false;
	}

	// Create a buffer and save the required information to it
	var _fname = argument0;
	var _buff = buffer_create(1, buffer_grow, 1);
	if global.EA_Type == "Instances"
	{
	buffer_write(_buff, buffer_bool, 0);
	var _name = sprite_get_name(global.EA_Image);
	buffer_write(_buff, buffer_string, _name);
	}
	else
	{
	buffer_write(_buff, buffer_bool, 1);
	var _name = tileset_get_name(global.EA_Image);
	buffer_write(_buff, buffer_string, _name);
	}
	buffer_write(_buff, buffer_s16, global.EA_Size);
	buffer_write(_buff, buffer_s8, global.EA_Mode);

	var _grid = ds_grid_write(global.EA_Grid);
	buffer_write(_buff, buffer_string, _grid);

	// Remove any previous file with the same name
	if file_exists(_fname + ".dat")
	{
	file_delete(_fname + ".dat");
	}

	// Save out the autowall data
	buffer_save(_buff, _fname + ".dat");

	scr_EA_Log("scr_EA_Save - Autowall room file saved correctly.");
	return true;



}
