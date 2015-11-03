#define hero_start_jump
//argument0 - hero_id
//argument1 - beats
//argument2 - height

with(argument0){
    if (movement_type == SLIDE){
        y -= MASK_SMALL_HEIGHT/2;
    }
    movement_type = JUMP;
    on_ground = false;
    actual_jump_height = argument2;
    actual_jump_length = argument1;// - ((x mod 32) < 16) * (x mod 32) + ((x mod 32) > 16) * (32-(x mod 32));
    jump_start_y = y;
    jump_start_beat = global.room_controller.beats;
    sprite_index = spr_jumper;
    mask_index = spr_mask_big;
    mask_h = MASK_BIG_HEIGHT;
    animation_start_beat = global.room_controller.beats;
}

#define hero_start_dash
//argument0 - hero_id
//argument1 - beats

with(argument0){
    dash_available = false;
    dash_actual_length = argument1;
    //obliczamy wysokosc rozpoczecia szybowania
    var dash_alititude = ((y div 32) + (vertical_direction==DOWNWARDS)) * 32;
    y = dash_alititude;
    next_y = y;
    movement_type = DASH;
    dash_start_x = x;
    dash_start_beat = global.room_controller.beats;
    dash_started = false;
    sprite_index = spr_bullet;
    mask_index = spr_mask_small;
    mask_h = MASK_SMALL_HEIGHT;
    animation_start_beat = global.room_controller.beats;
    audio_play_sound(snd_shot,100,0);
}

#define hero_start_slide
//argument0 - hero_id
//argument1 - beats

with(argument0){
    slide_start_beat = global.room_controller.beats;
    slide_actual_length = argument1;// - ((x mod 32) < 16) * (x mod 32) + ((x mod 32) > 16) * (32-(x mod 32));
    movement_type = SLIDE;
    sprite_index = spr_ball;
    mask_index = spr_mask_small;
    mask_h = MASK_SMALL_HEIGHT;
    animation_start_beat = global.room_controller.beats;
    slide_available = false;
    
    y += MASK_SMALL_HEIGHT/2;
    //next_y += MASK_SMALL_HEIGHT/2;
}

#define hero_start_run
//argument0 - hero_id

with(argument0){
    movement_type = RUN;
    sprite_index = spr_runner;
    mask_index = spr_mask_big;
    mask_h = MASK_BIG_HEIGHT;
    animation_start_beat = global.room_controller.beats;
}

#define hero_start_fall
//argument0 - hero_id

with(argument0){
    movement_type = FALL;
    fall_start_y = y;
    fall_start_beat = global.room_controller.beats;
    sprite_index = spr_runner;
    mask_index = spr_mask_big;
    mask_h = MASK_BIG_HEIGHT;
    animation_start_beat = global.room_controller.beats;
}