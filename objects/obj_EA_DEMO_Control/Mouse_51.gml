/// @description Remove Autowall Cells

if go
{
switch (draw_mode)
	{
	case "single": scr_EA_Remove(mouse_x, mouse_y); break;
	case "circle": scr_EA_Remove_Circle(mouse_x, mouse_y, draw_radius); break;
	case "rectangle": scr_EA_Remove_Rect(mouse_x, mouse_y, draw_size_w, draw_size_h); break;
	}
}



