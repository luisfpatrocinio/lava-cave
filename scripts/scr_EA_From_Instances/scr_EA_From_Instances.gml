/// @function								scr_EA_From_Instances(object, destroy);
/// @param	{string}		object			The object to use to get the autowall data
/// @param	{bool}			destroy			Whether to destroy the source layer (true) or not (false)
function scr_EA_From_Instances(argument0, argument1) {

	/// @description			This script can be used to create autowalls from source instances placed
	///							in the room. You supply the object index of the instances to extract the 
	///							autowall data from, and all the autowall cells will be populated using 
	///							this data. You can then choose to destroy these instances or not, which 
	///							is useful if you want to maintain the instances for collision checks while 
	///							having the autowall layer overlaying them. If destroy is set to true, then 
	///							the source instances will be destroyed at the end of this script. It is 
	///							worth noting that this will target all instances of the given type regardless
	///							of the layer they are on.
	///
	///							IMPORTANT!!!! This script MUST be called after the setup script.

	// Initialise variables
	var _size = global.EA_Size;
	var _type = global.EA_Type;
	var _layer = global.EA_Layer;
	var _tilemap = global.EA_Tilemap;
	var _src_inst = argument0;
	var _src_destroy = argument1;

	// Check the instance exists in the room
	if !instance_exists(_src_inst)
	{
	scr_EA_Log("scr_EA_From_Instances - ERROR! No instance of the given object exists in the room.")
	return false;
	}

	// Convert the instances into autowall cells
	with (_src_inst)
	{
	switch(_type)
		{
		case "Instances":
			if !instance_position(x, y, obj_EA_Wall_Parent)
				{
				instance_create_layer(x, y, _layer, obj_EA_Wall_Parent);
				}
			break;
		case "Tiles":
			var _cellx = x div _size;
			var _celly = y div _size;
			tilemap_set(_tilemap, 1, _cellx, _celly);
		break;
		}
	if _src_destroy
		{
		instance_destroy();
		}
	}

	// Re-initialise the autowall scripts including the new data
	scr_EA_Log("scr_EA_From_Instances - Autowall updated from instances correctly.");
	return scr_EA_Setup(global.EA_Mode, _type, global.EA_Image, _layer, _size);
	


}
