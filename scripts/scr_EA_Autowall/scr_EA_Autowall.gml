/// @function			scr_EA_Autowall(x, y);
///	@param	{real}	x	The x position to get the autowall index for
///	@param	{real}	y	The y position to get the autowall index for
function scr_EA_Autowall(argument0, argument1) {

	/// @description	DO NOT EDIT!!!! This script will return the correct image 
	///					index or tile index for the autowall at the given position.

	// Initialise variables
	var _x = argument0;
	var _y = argument1;
	var _cellx = _x div global.EA_Size;
	var _celly = _y div global.EA_Size;
	var _sz = global.EA_Size;

	// Check current autowall "type"
	switch(global.EA_Type)
	{
	case "Instances":
		switch(global.EA_Mode)
			{
			case 16:
		#region // 16 image index autowall instances
				var _val = 0;
				if place_meeting(_x, _y - _sz, obj_EA_Wall_Parent)
					{
					_val += 1;
					}
				if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					{
					_val += 8;
					}
				if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					{
					_val += 2;
					}
				if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					{
					_val += 4;
					}
				_val += 1;
				break;
		#endregion
			case 47:
		#region // 47 image index autowall instances
				var _val = 46;
				if place_meeting(_x, _y - _sz, obj_EA_Wall_Parent)
					{
					_val = 44;
					if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 41;
					    if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					        {
					        _val = 19;
					        if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					            {
					            _val = 15;
					            if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 13;
					                if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 9;
					                    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 1;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 47;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 8;
					                        }
					                    else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 5;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 4;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 12;
					                    }
					                else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 11;
					                    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                        {
					                        _val = 3;
					                        if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 2;
					                        }
					                    else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 10;
					                    }
					                else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					                    {
					                    _val = 7;
					                    if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 6;
					                    }
					                else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 14;
					                }
					            else if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 18;
					                if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 16;
					                }
					            else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 17;
					            }
					        else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					            {
					            _val = 31;
					            if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent)
					                {
					                _val = 29;
					                if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 28;
					                }
					            else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 30;
					            }
					        else if place_meeting(_x + _sz, _y - _sz, obj_EA_Wall_Parent) _val = 40;
					        }
					    else if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					    {
					    _val = 32;
					    if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					        {
					        _val = 27;
					        if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent)
					            {
					            _val = 26;
					            if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 24;
					            }
					        else if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 25;
					        }
					    }
					else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 39;
					    if place_meeting(_x - _sz, _y - _sz, obj_EA_Wall_Parent) _val = 38;
					    }
					}
				else if place_meeting(_x + _sz, _y, obj_EA_Wall_Parent)
					{
					_val = 43;
					if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					    {
					    _val = 35;
					    if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					        {
					        _val = 23;
					        if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent)
					            {
					            _val = 22;
					            if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 20;
					            }
					        else if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 21;
					        }
					    else if place_meeting(_x + _sz, _y + _sz, obj_EA_Wall_Parent) _val = 34;
					    }
					else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 33;
					    }
					}
				else if place_meeting(_x, _y + _sz, obj_EA_Wall_Parent)
					{
					_val = 42;
					if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					    {
					    _val = 37;
					    if place_meeting(_x - _sz, _y + _sz, obj_EA_Wall_Parent) _val = 36;
					    }
					}
				else if place_meeting(_x - _sz, _y, obj_EA_Wall_Parent)
					{
					_val = 45;
					}
				break;
		#endregion
			}
		break;
	case "Tiles":
		var _t = global.EA_Tilemap;
		switch(global.EA_Mode)
			{
			case 16:
		#region // 16 image autowall tiles
				var _val = 0;
				if tilemap_get(_t, _cellx, _celly - 1) != 0
					{
					_val += 1;
					}
				if tilemap_get(_t, _cellx, _celly + 1) != 0 
					{
					_val += 8;
					}
				if tilemap_get(_t, _cellx - 1, _celly) != 0
					{
					_val += 2;
					}
				if tilemap_get(_t, _cellx + 1, _celly) != 0
					{
					_val += 4;
					}
				_val += 1;
				break;
		#endregion
			case 47:
		#region // 47 image autowall tiles
				var _val = 46;
				if tilemap_get(_t, _cellx, _celly) != 0
					{
					if tilemap_get(_t, _cellx, _celly - 1)
						{
						_val = 44;
						if tilemap_get(_t, _cellx + 1, _celly)
						    {
						    _val = 41;
						    if tilemap_get(_t, _cellx, _celly + 1)
						        {
						        _val = 19;
						        if tilemap_get(_t, _cellx - 1, _celly)
						            {
						            _val = 15;
						            if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 13;
						                if tilemap_get(_t, _cellx + 1, _celly + 1)
						                    {
						                    _val = 9;
						                    if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 1;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 47;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 8;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 5;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 4;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 12;
						                    }
						                else if tilemap_get(_t, _cellx + 1, _celly + 1)
						                    {
						                    _val = 11;
						                    if tilemap_get(_t, _cellx - 1, _celly + 1)
						                        {
						                        _val = 3;
						                        if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 2;
						                        }
						                    else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 10;
						                    }
						                else if tilemap_get(_t, _cellx - 1, _celly + 1)
						                    {
						                    _val = 7;
						                    if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 6;
						                    }
						                else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 14;
						                }
						            else if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 18;
						                if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 16;
						                }
						            else if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 17;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly)
						            {
						            _val = 31;
						            if tilemap_get(_t, _cellx + 1, _celly - 1)
						                {
						                _val = 29;
						                if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 28;
						                }
						            else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 30;
						            }
						        else if tilemap_get(_t, _cellx + 1, _celly - 1) _val = 40;
						        }
						    else if tilemap_get(_t, _cellx, _celly + 1)
						    {
						    _val = 32;
						    if tilemap_get(_t, _cellx - 1, _celly)
						        {
						        _val = 27;
						        if tilemap_get(_t, _cellx - 1, _celly + 1)
						            {
						            _val = 26;
						            if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 24;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 25;
						        }
						    }
						else if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 39;
						    if tilemap_get(_t, _cellx - 1, _celly - 1) _val = 38;
						    }
						}
					else if tilemap_get(_t, _cellx + 1, _celly)
						{
						_val = 43;
						if tilemap_get(_t, _cellx, _celly + 1)
						    {
						    _val = 35;
						    if tilemap_get(_t, _cellx - 1, _celly)
						        {
						        _val = 23;
						        if tilemap_get(_t, _cellx + 1, _celly + 1)
						            {
						            _val = 22;
						            if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 20;
						            }
						        else if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 21;
						        }
						    else if tilemap_get(_t, _cellx + 1, _celly + 1) _val = 34;
						    }
						else if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 33;
						    }
						}
					else if tilemap_get(_t, _cellx, _celly + 1)
						{
						_val = 42;
						if tilemap_get(_t, _cellx - 1, _celly)
						    {
						    _val = 37;
						    if tilemap_get(_t, _cellx - 1, _celly + 1) _val = 36;
						    }
						}
					else if tilemap_get(_t, _cellx - 1, _celly)
						{
						_val = 45;
						}
					}
				else _val = 0;
				break;
		#endregion
			}
		break;
	}

	return _val;


}
