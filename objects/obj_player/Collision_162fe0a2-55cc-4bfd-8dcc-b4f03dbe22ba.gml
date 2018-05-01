/// @description 子彈碰撞

var vector2_x = 0; 
var vector2_y = 1; 
 
if(!is_hitted_){ 
	is_hitted_ = true; 
	velocity_[vector2_x] = other.dir_ * 4; 
	velocity_[vector2_y] = -7; 
	sprite_index = spr_player_walk; 
	hp = hp - 1; 
	alarm[0] = invincible_cooldown_; 
	with(other){
		instance_destroy();
	}
}