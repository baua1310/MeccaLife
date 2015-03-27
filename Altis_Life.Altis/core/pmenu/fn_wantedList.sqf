/*
	Copyright Â© 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list",/*"_units",*/"_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
if (playerSide == civilian) then {
		ctrlShow[2405,false];
		ctrlShow[9800,false];
		ctrlShow[2407,false];
} else if (playerSide == independent) then {
	closeDialog 0;
	hint "You have no business looking through criminal records!";
};

_display = findDisplay 2400;
_list = _display displayctrl 2401;

{
	_entry = _x;
	_list lbAdd format["%1", _entry select 1];
	_list lbSetData [(lbSize _list)-1,str(_entry)];
} forEach _info;

ctrlSetText[2404,"Connection Established"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
}; 

lbSort _list;