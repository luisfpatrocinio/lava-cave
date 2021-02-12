/// @description 

if draw_mode == "rectangle"
{
if draw_size_w < 8
	{
	draw_size_w += 1;
	}
if draw_size_h < 8
	{
	draw_size_h += 1;
	}
}
else if draw_mode = "circle"
{
if draw_radius < 6
	{
	draw_radius += 1;
	}
}