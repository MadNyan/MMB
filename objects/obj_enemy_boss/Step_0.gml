
//XY軸速度參數
var vector2_x = 0;
var vector2_y = 1;

//設定重力
velocity_[vector2_y] += gravity_;

//移動
move_and_contact_tiles(tile_map_id, 64, velocity_);

//死亡
if(hp <= 0){
	instance_destroy();
}

//攻擊

if(alarm[0] == -1){
	if(attack_times_ < 4){
		sprite_index = spr_enemy_boss_atk;
		var attack_y_ = 0;
		if(attack_times_%2==1){
			attack_y_ = 128;
		}
		instance_create_layer(x-100, y-attack_y_, "Bullet_Instances", obj_bullet_02);
		is_attacking_ = true;
	}else{
		is_attacking_ = false;
	}
	alarm[0] = attack_cooldown_;
	attack_times_ = attack_times_ + 1;
}
if(attack_times_ >= 8){
	attack_times_ = 0;
}