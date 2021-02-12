/// @description 

if !go
{
if room == rm_EA_DEMO_2
	{
	scr_EA_From_Tiles("Setup_Tiles", true);
	}
else if room == rm_EA_DEMO_3
	{
	scr_EA_From_Instances(obj_EA_DEMO_WallMarker, false);
	with (obj_EA_DEMO_WallMarker)
		{
		image_alpha = 0.25;
		}
	}
}

go = true;