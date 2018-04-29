/// @description 建置變數

velocity_ = [0, 0];
gravity_ = 0.5;
acceleration_ = 1;
max_velocity_ = 8;
jump_speed_ = 14;
is_attacking_ = false;
is_hitted_ = false;
direction_ = 1;
hp = 5;
attack_times_ = 0;
invincible_cooldown_ = room_speed*1;
alarm[0] = -1;

tile_map_id = layer_tilemap_get_id("Collisions");