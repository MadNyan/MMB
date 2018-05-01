
velocity_ = [0, 0];
gravity_ = 0.5;
acceleration_ = 1;
max_velocity_ = 2;
max_distance_ = 128+64;
sum_distance_ = 0;
is_hitted_ = false;
dir_ = -1;
hp = 2;
walk_cooldown_ = room_speed*1;
alarm[1] = -1;

tile_map_id = layer_tilemap_get_id("Collisions");