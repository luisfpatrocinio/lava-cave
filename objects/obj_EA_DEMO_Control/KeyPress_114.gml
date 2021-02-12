/// @description Change Sprite/Tileset

switch(global.EA_Type)
{
case "Instances":
	switch(scr_EA_Get_Image())
		{
		case spr_EA_16: scr_EA_Set_Image(spr_EA_16_Numbered); break;
		case spr_EA_16_Numbered: scr_EA_Set_Image(spr_EA_Platformer_16); break;
		case spr_EA_Platformer_16: scr_EA_Set_Image(spr_EA_TopDown_16); break;
		case spr_EA_TopDown_16: scr_EA_Set_Image(spr_EA_16); break;
		case spr_EA_47: scr_EA_Set_Image(spr_EA_47_Numbered); break;
		case spr_EA_47_Numbered: scr_EA_Set_Image(spr_EA_Platformer_47); break;
		case spr_EA_Platformer_47: scr_EA_Set_Image(spr_EA_TopDown_47); break;
		case spr_EA_TopDown_47: scr_EA_Set_Image(spr_EA_47); break;
		}
	break;
case "Tiles":
	switch(scr_EA_Get_Image())
		{
		case tl_EA_16: scr_EA_Set_Image(tl_EA_16_Numbered); break;
		case tl_EA_16_Numbered: scr_EA_Set_Image(tl_EA_Platformer_16); break;
		case tl_EA_Platformer_16: scr_EA_Set_Image(tl_EA_TopDown_16); break;
		case tl_EA_TopDown_16: scr_EA_Set_Image(tl_EA_16); break;
		case tl_EA_47: scr_EA_Set_Image(tl_EA_47_Numbered); break;
		case tl_EA_47_Numbered: scr_EA_Set_Image(tl_EA_Platformer_47); break;
		case tl_EA_Platformer_47: scr_EA_Set_Image(tl_EA_TopDown_47); break;
		case tl_EA_TopDown_47: scr_EA_Set_Image(tl_EA_47); break;
		}
	break;
}
