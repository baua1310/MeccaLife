/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
_onScreenTime = 4.1;

_role1 = "Hello!";
_role1names = ["Welcome to", "Mecca AltisLife"];
_role2 = "Teamspeak";
_role2names = ["104.227.2.10"];
_role3 = "Website";
_role3names = ["meccagaming.co"];
_role4 = "Built from Altis Life 4.0.0";
_role4names = ["by the MeccaDevTeam"];
_role5 = "Developers";
_role5names = ["Derek and Unnamed"];
_role6 = "Admins";
_role6names = ["Unnamed","Elemtael","Spectral","Crusader"];
_role7 = "Enjoy your stay";
_role7names = ["Have fun and follow the rules<br/>posted on our website<br/>"];
_role8 = "Special thanks to";
_role8names = ["All you guys that join us daily!<br/>Thank you!"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.50' color='#cc9900' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names]
];