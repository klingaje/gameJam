/// @description Insert description here
// You can write your code in this editor
if(global.bossSpawnCooldown !=5){
	global.bossSpawnCooldown += 1;
	spawnBosses(global.bossSpawnCooldown);
}else{
	global.bossSpawnCooldown = 1;
	spawnBosses(global.bossSpawnCooldown);
}

alarm[1] = 3600;