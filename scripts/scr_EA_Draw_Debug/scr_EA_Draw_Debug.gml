///	@function		scr_EA_Draw_Debug();
function scr_EA_Draw_Debug() {

	///	@description	This script should go in the Draw (or Draw End) event of some controller
	///					object in the room. It will draw a debug grid that shows the instances/tiles
	///					currently forming the autowall system. Note that this will SERIOUSLY affect
	///					framerate.

	// Check debug state
	if scr_EA_Get_Debug()
	{
	// Initialsie variables
	var _sz = scr_EA_Get_Size();
	var _grid = scr_EA_Get_Grid();
	var _type = scr_EA_Get_Type();
	var _gw = ds_grid_width(_grid);
	var _gh = ds_grid_height(_grid);
	var _a = draw_get_alpha();
	var _c = draw_get_colour();
	var _h = draw_get_halign();
	var _xs = _sz / 64;
	// Set draw values
	draw_set_alpha(0.25);
	draw_set_colour(c_red);
	draw_set_halign(fa_center);
	// Loop through the room width and height (in cells)
	for (var j = 0; j < _gh; ++j;)
		{
		for (var i = 0; i < _gw; ++i;)
			{
			var _tx = i * _sz;
			var _ty = j * _sz;
			// Draw the debug grid sprite
			draw_sprite_ext(spr_EA_Debug, 0, _tx, _ty, _xs, _xs, 0, c_red, 0.25);
			// Draw debug values based on instances or tiles
			if _grid[# i, j] > 0
				{
			if _type == "Instances"
					{
					draw_text(_tx + (_sz / 2), _ty + (_sz / 2) + 10, string(_grid[# i, j].image_index));
					draw_text_transformed(_tx + (_sz / 2), _ty + (_sz / 2) - 30, string(_grid[# i, j]), 0.6, 0.6, 0);
					}
				else
					{
					draw_text(_tx + (_sz / 2), _ty + (_sz / 2) + 10, string(_grid[# i, j]));
					}
				}
			else draw_text(_tx + (_sz / 2), _ty + (_sz / 2) - 10, "0");
			}
		}
	// Reset draw values
	draw_set_alpha(_a);
	draw_set_colour(_c);
	draw_set_halign(_h);
	}


}
