#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private "_unit";
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",CONTROL_DATA(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if(!isNil {(group _unit) GVAR "gang_name"}) exitWith {hint "This player is already in a gang"}; //Added

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit GVAR ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] call life_fnc_MP;
	_members = grpPlayer GVAR "gang_members";
	if (typeName (_members select 0) != "ARRAY") then {
		_members = [[_members],[getPlayerUID _unit, _unit GVAR ["realname",name _unit]]];
	} else {
		_members pushBack [getPlayerUID _unit, _unit GVAR ["realname",name _unit]];
	};
	grpPlayer SVAR ["gang_members",_members,true];
	hint format[localize "STR_GNOTF_InviteSent",_unit GVAR ["realname",name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};