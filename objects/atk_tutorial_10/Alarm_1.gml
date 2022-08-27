/// @description Trail Fire
ins = instance_furthest(earnaro.x, earnaro.y + earnaroHandOffset.y, obj_bbcollider)
largeRadius = ins.y - (earnaro.y + earnaroHandOffset.y) 

earnaro.sprite_index = spr_tutorial_earnaro_tpose

audio_play_sound_volume(sfx_fire_explosion, 40, 1, VOLUME_TYPE.SFX, false)

for (var i = 0; i < MAX_BULLETS; i++;)
{
	orbitBullets[i] = instance_create_depth(earnaro.x, earnaro.y + earnaroHandOffset.y, bb.depth - 10, obj_orbitspawnbullet);
	orbitBullets[i].sprite_index = spr_tutorial_bullet
	orbitBullets[i].radius = largeRadius/2
	var dir = (45 * ((i % 2) * 2 - 1)) + (i div 2) * 90
	orbitBullets[i].orbitPoint.x = orbitBullets[i].x + lengthdir_x(orbitBullets[i].radius, dir)
	orbitBullets[i].orbitPoint.y = orbitBullets[i].y + lengthdir_y(orbitBullets[i].radius, dir)
	orbitBullets[i].orbitSpeed = orbitingSpeed * ((i % 2) * 2 - 1)
	orbitBullets[i].image_xscale = 2
	orbitBullets[i].image_yscale = 2
	orbitBullets[i].life = 6000
	orbitBullets[i].persists = true
	orbitBullets[i].damage = earnaro.atk
}
canOrbitCenter = true
