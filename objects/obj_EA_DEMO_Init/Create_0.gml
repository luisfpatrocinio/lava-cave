/// @description Init Essential Autowall

/// This object is simply to initialise the autowall scripts.
/// You should do this at the start of the game as soon as possible
/// so that the required global variables are setup and ready.
/// To actually use the autowall scripts, you will need to 
///	call the script "scr_EA_Setup()" in an object (in the Create
///	Event, normally) in each of the rooms that you want to have
///	autwalls working. See that script and the object "obj_EA_DEMO_Control"
/// for the full instructions on how to use this asset.

scr_EA_Init();

room_goto_next();