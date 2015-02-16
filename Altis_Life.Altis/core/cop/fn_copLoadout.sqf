#include <macro.h>

/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_BG_Guerilla2_2";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_Carryall_oucamo";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ToolKit";
player addItem "ToolKit";

if (playerSide == west) then {

switch (FETCH_CONST(life_coplevel)) do {

	case 1:
	{
		[[player,0,"textures\cadetTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "hgun_P07_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
	};
	
	case 2:
	{
		[[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MXC_F";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		
	};
	
	case 3:
	{
	    [[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MXC_F";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	};
	
	case 4:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MXM_F";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	};
	
	case 5:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MXM_F";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	};
	case 6:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MX_sw_F";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
	};
	case 7:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addWeapon "arifle_MXM_F";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	};
	
};
};
[] call life_fnc_saveGear;