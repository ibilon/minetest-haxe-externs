/*
Copyright (c) 2017 Valentin Lemière

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package minetest.extern;

import lua.Lua;
import lua.Table;

/**
Lua table with automatic conversion from Maps and Arrays.
**/
abstract AutoConvLuaTable<K, V> (Table<K, V>) from Table<K, V>
{
	function new (table:Table<K, V>) this = table;

	@:from public static function fromMap<K, V> (map:Map<K, V>) : AutoConvLuaTable<K, V>
	{
		var table = Table.create({});

		for (k in map.keys())
		{
			Lua.rawset(table, k, map[k]);
		}

		return new AutoConvLuaTable(table);
	}

	@:from public static function fromArray<T> (arr:Array<T>) : AutoConvLuaTable<Int, T>
	{
		var table = Table.create({});

		for (i in 0...arr.length)
		{
			Table.insert(table, i, arr[i]);
		}

		return new AutoConvLuaTable(table);
	}
}
