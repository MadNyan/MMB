
draw_self();

if(!instance_exists(obj_player)){
	exit;
}

draw_health_ = lerp(draw_health_, obj_player.hp, 0.5);

draw_set_color(c_blue);
draw_rectangle(x+7, y+7, x+248*draw_health_/obj_player.max_hp, y+24, false);
draw_set_color(c_white);