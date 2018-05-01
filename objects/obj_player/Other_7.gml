/// @description 攻擊結束

if((is_attacking_) && (sprite_index == spr_player_atk00 || spr_player_atk01)){
	is_attacking_ = false;
	attack_times_ = 0;
	if(instance_exists(atk_hitbox)){
		with(atk_hitbox){
			instance_destroy();
		}
	}
}