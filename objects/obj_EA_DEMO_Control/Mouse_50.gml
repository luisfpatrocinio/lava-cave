/// @description Add Autowall Cells

if go
{
switch (draw_mode)
	{
	case "single": scr_EA_Add(clamp(0, mouse_x, room_width - 1), clamp(0, mouse_y, room_height - 1)); break;
	case "circle": scr_EA_Add_Circle(clamp(0, mouse_x, room_width - 1), clamp(0, mouse_y, room_height - 1), draw_radius); break;
	case "rectangle": scr_EA_Add_Rect(mouse_x, mouse_y, draw_size_w, draw_size_h); break;
	}
}



