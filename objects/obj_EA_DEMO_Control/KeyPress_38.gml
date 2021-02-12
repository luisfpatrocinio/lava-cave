/// @description 
if draw_mode != "single"
{
if draw_mode == "rectangle"
	{
	if draw_size_h < 8 draw_size_h += 1;
	}
else
	{
	if draw_radius < 6 draw_radius += 1;
	}
}