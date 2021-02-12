/// @description Change Room

switch (room)
{
case rm_EA_DEMO_1: room_goto(rm_EA_DEMO_2); break;
case rm_EA_DEMO_2: room_goto(rm_EA_DEMO_3); break;
case rm_EA_DEMO_3: room_goto(rm_EA_DEMO_1); break;
}