//check按鍵事件
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

//XY軸速度參數
var vector2_x = 0;
var vector2_y = 1;

//改變方向
if((key_right - key_left) != 0){
	direction_ = (key_right - key_left);
}

//設定移動速度
x_input = (key_right - key_left) * acceleration_;
velocity_[vector2_x] = clamp(velocity_[vector2_x] + x_input, -max_velocity_, max_velocity_);
if(x_input == 0){
	velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, 0.5);
}

//設定重力
velocity_[vector2_y] += gravity_;

//移動與碰撞
move_and_contact_tiles(tile_map_id, 64, velocity_);

//檢查是否在地面
var on_ground = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if on_ground {
	//跳躍
	if key_jump {
		velocity_[vector2_y] = - jump_speed_;
	}
} else {
	//控制跳躍高度
	if key_jump && velocity_[vector2_y] <= -(jump_speed_/3) {
		velocity_[vector2_y] = - (jump_speed_/3);
	}
}