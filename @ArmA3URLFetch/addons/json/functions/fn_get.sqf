
/*
	Author(s):
		Muzzleflash
		TheMysteriousVincent (modified)
*/

private _node = _this select 0;
private _pathParts = (_this select 1) call a3uf_json_PathParts;
//For each part of the path
{
	private _part = _x;
	//Only objects have keys
	if (_node select 0 != "object") exitWith
	{
		_node = objNull;
	};
	//Find index of key
	private _index = -1;
	{
		if (_x select 0 == _part) exitWith
		{
			_index = _forEachIndex;
		};
	} forEach (_node select 1);
	if (_index == -1) exitWith
	{
		_node = objNull;
	};
	//Select child with the key matching the part
	_node = ((_node select 1) select _index) select 1;
} forEach _pathParts;
//Did client mean to extract array?
if (typeName _node == typeName [] and {_node select 0 == "array"}) then
{
	_node = _node select 1;
};
_node;