/// @function								scr_EA_From_Tiles(src_layer, destroy);
/// @param	{real/string}	src_layer		The source layer to get the autowall data from
/// @param	{bool}			destroy			Whether to destroy the source layer (true) or not (false)
function scr_EA_From_Tiles(argument0, argument1) {

	/// @description			This script can be used to create autowalls from a source layer of tiles.
	///							You supply the source layer to extract the autowall data from, and all 
	///							the autowall cells will be populated using this data. You can then choose 
	///							to destroy this layer or not, which is useful if you want to maintain the 
	///							source layer for collision checks while having the autowall layer overlaying 
	///							it. If destroy is set to true, then the source layer will be destroyed at 
	///							the end of this script.
	///							
	///							IMPORTANT!!!! This script MUST be called after the setup script.

	// Initialise variables
	var _size = global.EA_Size;
	var _type = global.EA_Type;
	var _layer = global.EA_Layer;
	var _tilemap = global.EA_Tilemap;
	var _src_layer = argument0;
	var _src_tilemap = -1;
	var _src_destroy = argument1;

	// Check the layer given
	if is_string(_src_layer)
	{
	_src_layer = layer_get_id(_src_layer);
	}
	if !layer_exists(_src_layer)
	{
	scr_EA_Log("scr_EA_From_Tiles - ERROR! Given layer ID does not exist.")
	return false;
	}
	else
	{
	_src_tilemap = layer_tilemap_get_id(_src_layer);
	if !layer_tilemap_exists(_src_layer, _src_tilemap)
		{
		scr_EA_Log("scr_EA_From_Tiles - ERROR! Layer does not contain any tile data.")
		return false;
		}
	}

	// Check the source layer tilemap is the correct format
	var _tilew = tilemap_get_tile_width(_src_tilemap);
	var _tileh = tilemap_get_tile_height(_src_tilemap);
	if _tilew != _size || _tileh != _size
	{
	scr_EA_Log("scr_EA_From_Tiles - ERROR! Tilemap cell size is differnt to the autowall tile size.")
	return false;
	}

	// Convert tiles or instances from the source layer into autowall cells
	var _tw = tilemap_get_width(_src_tilemap);
	var _th = tilemap_get_height(_src_tilemap);
	for (var j = 0; j < _th; ++j;)
		{
		for (var i = 0; i < _tw; ++i;)
			{
			if tilemap_get(_src_tilemap, i, j) > 0
				{
				switch (_type)
					{
					case "Instances":
						instance_create_layer(i * _size, j * _size, _layer, obj_EA_Wall_Parent);
						break;
					case "Tiles":
						tilemap_set(_tilemap, 1, i, j);
						break;
					}
				}
			}
		}

	// Destroy source layer if required
	if _src_destroy
	{
	layer_destroy(_src_layer);
	}

	// Re-initialise the autowall scripts including the new data
	scr_EA_Log("scr_EA_From_Tiles - Autowall updated from tiles correctly.");
	return scr_EA_Setup(global.EA_Mode, _type, global.EA_Image, _layer, _size);





}
