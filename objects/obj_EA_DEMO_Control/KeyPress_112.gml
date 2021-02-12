/// @description Change Mode

var _image = scr_EA_Get_Image();

if scr_EA_Get_Mode() == 16
{
if scr_EA_Get_Type() == "Instances"
	{
	switch (_image)
		{
		case spr_EA_16: _image = spr_EA_47; break;
		case spr_EA_16_Numbered: _image = spr_EA_47_Numbered; break;
		case spr_EA_Platformer_16: _image = spr_EA_Platformer_47; break;
		case spr_EA_TopDown_16: _image = spr_EA_TopDown_47; break;
		}
	scr_EA_Set_Mode(47, _image, 64, false);
	}
else
	{
	switch (_image)
		{
		case tl_EA_16: _image = tl_EA_47; break;
		case tl_EA_16_Numbered: _image = tl_EA_47_Numbered; break;
		case tl_EA_Platformer_16: _image = tl_EA_Platformer_47; break;
		case tl_EA_TopDown_16: _image = tl_EA_TopDown_47; break;
		}
	scr_EA_Set_Mode(47, _image, 64, false);
	}
}
else
{
if scr_EA_Get_Type() == "Instances"
	{
	switch (_image)
		{
		case spr_EA_47: _image = spr_EA_16; break;
		case spr_EA_47_Numbered: _image = spr_EA_16_Numbered; break;
		case spr_EA_Platformer_47: _image = spr_EA_Platformer_16; break;
		case spr_EA_TopDown_47: _image = spr_EA_TopDown_16; break;
		}
	scr_EA_Set_Mode(16, _image, 64, false);
	}
else
	{
	switch (_image)
		{
		case tl_EA_47: _image = tl_EA_16; break;
		case tl_EA_47_Numbered: _image = tl_EA_16_Numbered; break;
		case tl_EA_Platformer_47: _image = tl_EA_Platformer_16; break;
		case tl_EA_TopDown_47: _image = tl_EA_TopDown_16; break;
		}
	scr_EA_Set_Mode(16, _image, 64, false);
	}
}