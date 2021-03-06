/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_position","_isalive","_isjailed"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_isjailed = [_this,7,false] call BIS_fnc_param;
_isjailed = [_isjailed] call DB_fnc_bool;
_position = [_this,8,""] call BIS_fnc_param;
_isalive = [_this,9,false] call BIS_fnc_param;
_isalive = [_isalive] call DB_fnc_bool; 

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};


switch (_side) do {
	case west: {_query = format["playerWestUpdate:%1:%2:%3:%4:%5",_name,_cash,_bank,_licenses,_uid];};
	case civilian: {_query = format["playerCivilianUpdate:%1:%2:%3:%4:%6:%7:%8:%9:%5",_name,_cash,_bank,_licenses,_uid,_gear,_isjailed,_position,_isalive];};
	case independent: {_query = format["playerIndependentUpdate:%1:%2:%3:%4:%6:%5",_name,_cash,_bank,_licenses,_uid,_gear];};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

/*
// Update player position 
if (_side == civilian) then {
	_query = format["playerPositionUpdate:%1:%2:%3",_position,_isalive,_uid];
	waitUntil {sleep (random 0.3); !DB_Async_Active};
	_queryResult = [_query,1] call DB_fnc_asyncCall;
};

*/