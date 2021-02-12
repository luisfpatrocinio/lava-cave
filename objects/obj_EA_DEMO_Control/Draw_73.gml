/// @description Debug

scr_EA_Draw_Debug();


if draw_mode == "rectangle"
{
var _sz = scr_EA_Get_Size();
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
var _cellx = (mouse_x div _sz);
var _celly = (mouse_y div _sz);
var _areaw = draw_size_w;
var _areah = draw_size_h;
if _areaw div 2 == 0 && draw_size_w != 1 _cellx += 1;
if _areah div 2 == 0 && draw_size_h != 1 _celly += 1;

var _w1 = floor(_areaw / 2);
var _h1 = floor(_areah / 2);
var _w2 = _areaw - _w1;
var _h2 = _areah - _h1;

var _areax1 = clamp(_cellx - _w1, 0, _rw - 1) * _sz;
var _areay1 = clamp(_celly - _h1, 0, _rh - 1) * _sz;

var _areax2 = clamp(_cellx + _w2, 1, _rw) * _sz;
var _areay2 = clamp(_celly + _h2, 1, _rh) * _sz;

var _areax3 = (_areax1 - _sz);
var _areay3 = (_areay1 - _sz);

var _areax4 = (_areax2 + _sz);
var _areay4 = (_areay2 + _sz);

draw_rectangle_colour(_areax1, _areay1, _areax2, _areay2, c_white, c_white, c_white, c_white, true);
draw_set_alpha(0.25)
draw_rectangle_colour(_areax3, _areay3, _areax4, _areay4, c_yellow, c_yellow, c_yellow, c_yellow, true);
}
else if draw_mode == "circle"
{
var _sz = scr_EA_Get_Size();
var _hsz = _sz / 2;
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
var _cellx = clamp((mouse_x div _sz), -draw_radius, _rw + draw_radius - 1);
var _celly = clamp((mouse_y div _sz), -draw_radius, _rh + draw_radius - 1);
draw_circle_colour((_cellx * _sz) + _hsz, (_celly * _sz) + _hsz, (draw_radius) * _sz + _hsz, c_white, c_white, true);
draw_set_alpha(0.25)
draw_circle_colour((_cellx * _sz) + _hsz, (_celly * _sz) + _hsz, (draw_radius + 1) * _sz + _hsz, c_yellow, c_yellow, true);
}
else
{
var _sz = scr_EA_Get_Size();
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
var _cellx = clamp((mouse_x div _sz), 0, _rw - 1) * _sz;
var _celly = clamp((mouse_y div _sz), 0, _rh - 1) * _sz;
draw_rectangle_colour(_cellx, _celly, _cellx + _sz, _celly + _sz, c_white, c_white, c_white, c_white, true);
draw_set_alpha(0.25);
draw_rectangle_colour(_cellx - _sz, _celly - _sz, _cellx + (_sz * 2), _celly + (_sz * 2), c_yellow, c_yellow, c_yellow, c_yellow, true);
}

draw_set_alpha(1);