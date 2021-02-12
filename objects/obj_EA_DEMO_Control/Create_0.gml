/// @description Init Controller


draw_set_font(fnt_EA_DEMO);
show_debug_overlay(true);
go = false;
draw_mode = "single"
draw_size_w = 2;
draw_size_h = 2;
draw_radius = 1;

// Initialise the autowall scripts for this room
scr_EA_Setup(47, "Tiles", tl_EA_TopDown_47, "Autowall_Tiles", 64);

