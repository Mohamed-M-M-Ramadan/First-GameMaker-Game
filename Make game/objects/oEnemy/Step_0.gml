//gravity
vsp = vsp + grv;


//Check for Hcollision
if(place_meeting(hsp + x , y ,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x +sign(hsp);
	}      
	hsp = -hsp;
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
		sprite_index = sEnemy_fall;
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
		sprite_index = sEnemy;
	}
	
}

if (!hsp == 0)
{
	
	image_xscale = sign(hsp);
}
	
	