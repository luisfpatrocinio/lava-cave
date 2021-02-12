/// @description UI

var _rw = display_get_gui_width() / 2;
var _rh = display_get_gui_height() / 2;

draw_set_halign(fa_left);
draw_set_colour(c_black);
draw_text(30, 30, "(F1) Autowall Mode = " + string(scr_EA_Get_Mode()));
draw_text(34, 30, "(F1) Autowall Mode = " + string(scr_EA_Get_Mode()));
draw_text(34, 34, "(F1) Autowall Mode = " + string(scr_EA_Get_Mode()));
draw_text(30, 34, "(F1) Autowall Mode = " + string(scr_EA_Get_Mode()));

draw_set_colour(c_white);
draw_text(32, 32, "(F1) Autowall Mode = " + string(scr_EA_Get_Mode()));

var _image = scr_EA_Get_Image();
if scr_EA_Get_Type() == "Instances"
{
draw_set_colour(c_black);
draw_text(30, 62, "(F2) Autowall Type = Instances");
draw_text(34, 62, "(F2) Autowall Type = Instances");
draw_text(34, 66, "(F2) Autowall Type = Instances");
draw_text(30, 66, "(F2) Autowall Type = Instances");
draw_set_colour(c_white);
draw_text(32, 64, "(F2) Autowall Type = Instances");
_image = sprite_get_name(_image);
}
else
{
draw_set_colour(c_black);
draw_text(30, 62, "(F2) Autowall Type = Tiles");
draw_text(34, 62, "(F2) Autowall Type = Tiles");
draw_text(34, 66, "(F2) Autowall Type = Tiles");
draw_text(30, 66, "(F2) Autowall Type = Tiles");
draw_set_colour(c_white);
draw_text(32, 64, "(F2) Autowall Type = Tiles");
_image = tileset_get_name(_image);
}
if scr_EA_Get_Debug()
{
var _debug = "true";
}
else
{
var _debug = "false";
}
draw_set_colour(c_black);
draw_text(30, 94, "(F3) Autowall Image = " + _image);
draw_text(34, 94, "(F3) Autowall Image = " + _image);
draw_text(34, 98, "(F3) Autowall Image = " + _image);
draw_text(30, 98, "(F3) Autowall Image = " + _image);
draw_set_colour(c_white);
draw_text(32, 96, "(F3) Autowall Image = " + _image);
draw_set_colour(c_black);
draw_text(30, 126, "(F4) Draw Tool = " + draw_mode);
draw_text(34, 126, "(F4) Draw Tool = " + draw_mode);
draw_text(34, 130, "(F4) Draw Tool = " + draw_mode);
draw_text(30, 130, "(F4) Draw Tool = " + draw_mode);
draw_set_colour(c_white);
draw_text(32, 128, "(F4) Draw Tool = " + draw_mode);
draw_set_colour(c_black);
draw_text(30, 158, "(F5) Debug Mode = " + _debug);
draw_text(34, 158, "(F5) Debug Mode = " + _debug);
draw_text(34, 162, "(F5) Debug Mode = " + _debug);
draw_text(30, 162, "(F5) Debug Mode = " + _debug);
draw_set_colour(c_white);
draw_text(32, 160, "(F5) Debug Mode = " + _debug);
draw_set_colour(c_black);
draw_text(30, 190, "(F6) Save Room");
draw_text(34, 190, "(F6) Save Room");
draw_text(34, 194, "(F6) Save Room");
draw_text(30, 194, "(F6) Save Room");
draw_set_colour(c_white);
draw_text(32, 192, "(F6) Save Room");
draw_set_colour(c_black);
draw_text(30, 222, "(F7) Load Room");
draw_text(34, 222, "(F7) Load Room");
draw_text(34, 226, "(F7) Load Room");
draw_text(30, 226, "(F7) Load Room");
draw_set_colour(c_white);
draw_text(32, 224, "(F7) Load Room");
draw_set_colour(c_black);
draw_text(30, 254, "(F8) Change Room");
draw_text(34, 254, "(F8) Change Room");
draw_text(34, 258, "(F8) Change Room");
draw_text(30, 258, "(F8) Change Room");
draw_set_colour(c_white);
draw_text(32, 256, "(F8) Change Room");

if !go
{
draw_set_alpha(0.75);
draw_set_colour(c_black);
draw_roundrect(_rw - 220, _rh - 100, _rw + 220, _rh + 100, false);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_roundrect(_rw - 220, _rh - 100, _rw + 220, _rh + 100, true);
switch(room)
	{
	case rm_EA_DEMO_1:
		draw_text(_rw, _rh - 90, "WELCOME TO THE ESSENTIAL AUTOWALL DEMO!");
		draw_text(_rw, _rh - 50, "Use LMB to add an autowall cell.");
		draw_text(_rw, _rh - 20, "Use RMB to remove an autowall cell.");
		draw_text(_rw, _rh + 10, "Use Functions Keys to change properties.");
		draw_text(_rw, _rh + 40, "Use Arrow Keys to change tool size.");
		draw_text_transformed(_rw, _rh + 75, "PRESS ANY KEY", 0.75, 0.75, 0);
		break;
	case rm_EA_DEMO_2:
		draw_text(_rw, _rh - 90, "This room ceates the autowall layer from tiles.");
		draw_text(_rw, _rh - 50, "The tiles are on a different layer to the autowall");
		draw_text(_rw, _rh - 20, "and will be removed after being autowalled.");
		draw_text(_rw, _rh + 40, "Press any key to convert the tile layer.");
		break;
	case rm_EA_DEMO_3:
		draw_text(_rw, _rh - 90, "This room ceates the autowall layer from instances.");
		draw_text(_rw, _rh - 50, "The instances are on a different layer to");
		draw_text(_rw, _rh - 20, "the autowall and will NOT be removed after");
		draw_text(_rw, _rh + 10, "being autowalled.");
		draw_text(_rw, _rh + 60, "Press any key to convert the instance layer.");
		break;
	}
}

draw_set_alpha(0.75);
draw_set_colour(c_black);
draw_set_halign(fa_center);
draw_roundrect(_rw - 180, _rh + 320, _rw + 180, _rh + 370, false);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_roundrect(_rw - 180, _rh + 320, _rw + 180, _rh + 370, true);
draw_text(_rw, _rh + 333, "Click To Go To The YYG MarketPlace");



