/// @description Draw Tool

switch(draw_mode)
{
case "single": draw_mode = "rectangle"; break;
case "rectangle": draw_mode = "circle"; break;
case "circle": draw_mode = "single"; break;
}