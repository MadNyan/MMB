
x = x + dir_ * velocity_x_;
collide_ = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_left, bbox_bottom-1], [bbox_right-1, bbox_top], [bbox_right-1, bbox_bottom-1]);

//觸碰牆壁後銷毀
if(collide_){
	instance_destroy();
}