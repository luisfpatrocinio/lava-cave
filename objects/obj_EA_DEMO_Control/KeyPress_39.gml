/// @description 
if draw_mode != "single"
{
if draw_mode == "rectangle"
	{
	if draw_size_w < 10 draw_size_w += 1;
	}
else
	{
	if draw_radius < 6 draw_radius += 1;
	}
}