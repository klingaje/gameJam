/// @description Insert description here
// You can write your code in this editor



if(global.timeInGamesec == 59){
	global.timeInGameMin += 1;
	global.timeInGamesec = 0;
}else{
	global.timeInGamesec += 1;
}


alarm[0] = 60;