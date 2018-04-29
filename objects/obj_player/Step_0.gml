/// @description 玩家動作

//check按鍵事件
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(ord("Z"));
key_attack = keyboard_check_pressed(ord("X"));

//XY軸速度參數
var vector2_x = 0;
var vector2_y = 1;

//設定移動速度
if(!is_hitted_){
	x_input = (key_right - key_left) * acceleration_;
	velocity_[vector2_x] = clamp(velocity_[vector2_x] + x_input, -max_velocity_, max_velocity_);
	if(x_input == 0){
		velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, 0.5);
	}
}

//設定重力
velocity_[vector2_y] += gravity_;

//檢查是否在攻擊or傷害
if(!is_attacking_){
	//改變方向&走路動作
	if(x_input != 0){
		direction_ = sign(x_input);
		image_xscale = direction_;
		sprite_index = spr_player_walk;
	}else{
		sprite_index = spr_player_stand;
	}
	//檢查是否在地面
	var on_ground = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
	if on_ground {
		//跳躍
		if key_jump {
			velocity_[vector2_y] = - jump_speed_;
		}
		is_hitted_ = false;
	} else {
		//跳躍走路動作
		sprite_index = spr_player_jump;
	}
}

	
//移動與碰撞
move_and_contact_tiles(tile_map_id, 64, velocity_);

//攻擊
if(key_attack && (attack_times_ < 3)){
	if((sprite_index == spr_player_atk00) && (image_index > 5)){
		sprite_index = spr_player_atk01;
		image_index = 0;
		attack_times_ = attack_times_ + 1;
		if(is_attacking_){
			with(atk_hitbox){
				instance_destroy();
				is_attacking_ = false;
			}
		}
	}else if((sprite_index == spr_player_atk01) && (image_index > 5) || !(sprite_index == spr_player_atk01 || sprite_index == spr_player_atk00)){
		sprite_index = spr_player_atk00;
		image_index = 0;
		attack_times_ = attack_times_ + 1;
		if(is_attacking_){
			with(atk_hitbox){
				instance_destroy();
				is_attacking_ = false;
			}
		}
	}
	is_attacking_ = true;
}
if(is_attacking_ && (image_index == 3)){
	atk_hitbox = instance_create_layer(x, y, "Instances", obj_player_atk_hitbox);
	atk_hitbox.image_xscale = direction_;
}

//計時 無敵時間
if(alarm[0] < 0){
	is_hitted_ = false;
	image_xscale = direction_;
}else{
	if((alarm%2)==0){
		if(image_xscale != 0){
			image_xscale = 0;
		}else{
			image_xscale = direction_;
		}
	}
}