
var vector2_x = 0;
var vector2_y = 1;

with(other){
	is_hitted_ = true;
	velocity_[vector2_x] = other.image_xscale * 4;
	velocity_[vector2_y] = -7;
	hp = hp - 1;
}

instance_destroy();