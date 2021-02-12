/// @description 
#macro kcp keyboard_check_pressed
#macro kc keyboard_check

if (kc(vk_home)) {
for (var i = 0; i < ds_grid_width(grid); i++) {
		for (var j = 0; j < ds_grid_height(grid); j++) {
			draw_text(i * CW, j * CH, grid[# i, j])	;
		}
	}
}

if (kcp(vk_space)) {
	game_restart();
}