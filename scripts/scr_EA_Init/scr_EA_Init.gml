/// @function					scr_EA_Init();
function scr_EA_Init() {

	/// @description	This script simply initialises the global variables that the autowall
	///					scripts require and should be called right at the start of the game, 
	///					even if you don't require the autowall features in the first rooms.

	// Initialise globals
	global.EA_Mode = 16;			// The autowall mode, either 16 or 47
	global.EA_Type = "Instances"	// The autowall type, either "instances" or "Tiles"
	global.EA_Image = -1;			// The mage to use for the autowall, either a sprite index or a tilset index
	global.EA_Layer = -1;			// The layer the autowall tiles/instances will be on
	global.EA_Tilemap = -1;			// The tilemap that the autowall tiles are on (-1 if using instances)
	global.EA_Size = 32;			// The size (length and height) of a single autowall cell, in pixels
	global.EA_Grid = -1;			// The autowall DS grid ID, used for certain features and debugging
	global.EA_Debug = false;		// The autowall debug mode controller



}
