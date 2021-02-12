/// @description 
var _rw = display_get_gui_width() / 2;
var _rh = display_get_gui_height() / 2;

if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _rw - 180, _rh + 320, _rw + 180, _rh + 370)
{
url_open_ext("https://marketplace.yoyogames.com/assets/6312/essential-autowall-2", "_blank");
}