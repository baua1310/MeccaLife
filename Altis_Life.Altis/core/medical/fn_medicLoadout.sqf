/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_B_CTRG_3";
player addBackpack "B_Carryall_oucamo";
player addItem "FirstAidKit";

player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "Medikit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem	"Chemlight_green";
player addItem	"Chemlight_red";
player addItem	"Chemlight_red";
player addItem	"Chemlight_red";
player addItem	"Chemlight_yellow";
player addItem	"Chemlight_blue";

[[player,0,"textures\medic_uniform.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP;

[] call life_fnc_saveGear;
[] call life_fnc_Uniformscolor;