

//XY軸速度參數
var vector2_x = 0;
var vector2_y = 1;

//走夠距離就射擊&轉向
if(abs(sum_distance_) >= max_distance_){
	velocity_[vector2_x] = 0;
	sum_distance_ = 0;
	alarm[2] = walk_cooldown_;
	bullet_ = instance_create_layer(x+dir_*16, y+18, "Bullet_Instances", obj_bullet_01);
	bullet_.dir_ = dir_;
}
if(dir_ == -1){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

//設定移動速度
if(!is_hitted_ && (alarm[2] < 0)){
	x_input = dir_ * acceleration_;
	velocity_[vector2_x] = clamp(velocity_[vector2_x] + x_input, -max_velocity_, max_velocity_);
	sum_distance_ = sum_distance_ + velocity_[vector2_x];
}

//設定重力
velocity_[vector2_y] += gravity_;

//移動
move_and_contact_tiles(tile_map_id, 64, velocity_);

//檢查是否在地面
on_ground = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if on_ground {
	is_hitted_ = false;
}

//死亡
if(hp <= 0){
	instance_destroy();
}