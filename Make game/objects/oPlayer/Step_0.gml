//Check for input
key_left = keyboard_check(vk_left)||keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)||keyboard_check(ord("D"));
key_Jump = keyboard_check(vk_space)||keyboard_check(ord("W"));
//Calc movement
var move = key_right - key_left;

hsp = move*walksp;

//gravity
vsp = vsp + grv;

//Jump
if(place_meeting(x,y+1,oWall)&&(key_Jump))
{
	vsp =-14;
}

//Check for Hcollision
if(place_meeting(hsp + x , y ,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x +sign(hsp);
	}      
	hsp = 0;
}
x = x + hsp;

//Check for Vcollision
if(place_meeting( x , y + vsp ,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y +sign(vsp);
	}      
	vsp = 0;
}
y = y + vsp;

//Animatons
if(!place_meeting(x,y+1,oWall))
{
		sprite_index = sPlayer_fall;
		image_speed = 1;
		if (sign(vsp)>0)
		{
			image_index = 0;
		}
		else image_index = 1;
}

else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}
	
}

if (!hsp == 0)
{
	
	image_xscale = sign(hsp);
}
	
	