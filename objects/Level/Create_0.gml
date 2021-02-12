/// @description 
#macro CW	16
#macro CH	16
#macro VOID	-7
width = room_width/CW;
height = room_height/CH;
grid = ds_grid_create(width, height);
ds_grid_clear(grid, VOID);


var _y_atual = height/2;
var _altura = 8;
for (var i = 0; i < ds_grid_width(grid); i++) {
	var _y1 = _y_atual - _altura;
	var _y2 = _y_atual;
	ds_grid_set_region(grid, i, _y1, i, _y2, 0);
	
	//Aleatorizar altura
	if (irandom(3) == 0) then _altura += choose(-1, 1);
	_altura = clamp(_altura, 4, 12);
	
	//Aleatorizar y atual
	if (irandom(2) == 0) then _y_atual+= choose(-1, 1);
	_y_atual = clamp(_y_atual, 0, height-1);
}

