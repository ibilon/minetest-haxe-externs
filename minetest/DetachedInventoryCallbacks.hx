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

package minetest;

//TODO: find out list's type (String for now)
//TODO: find out stack's type (Any for now)
typedef DetachedInventoryCallbacks = {
	/**
	Called when a player wants to move items inside the inventory. Return the number of item allowed to move, or -1 to copy the stack instead of move.
	Parameters (in order): inventory, fromList, fromIndex, toList, toIndex, count, player.
	**/
	@:native("allow_move")
	var allowMove : InvRef->String->Int->String->Int->Int->String->Int;

	/**
	Called when a player wants to put items into the inventory. Return the number of item allowed to move, or -1 to copy the stack instead of move.
	Parameters (in order): inventory, listName, index, stack, player.
	**/
	@:native("allow_put")
	var allowPut : InvRef->String->Int->Any->String->Int;

	/**
	Called when a player wants to take items out of the inventory. Return the number of item allowed to move, or -1 to copy the stack instead of move.
	Parameters (in order): inventory, listName, index, stack, player.
	**/
	@:native("allow_take")
	var allowTake : InvRef->String->Int->Any->String->Int;

	/**
	Called after the actual action has happened, according to what was allowed.
	Parameters (in order): inventory, fromList, fromIndex, toList, toIndex, count, player.
	**/
	@:native("on_move")
	var onMove : InvRef->String->Int->String->Int->Int->String->Void;

	/**
	Called after the actual action has happened, according to what was allowed.
	Parameters (in order): inventory, listName, index, stack, player.
	**/
	@:native("on_put")
	var onPut : InvRef->String->Int->Any->String->Void;

	/**
	Called after the actual action has happened, according to what was allowed.
	Parameters (in order): inventory, listName, index, stack, player.
	**/
	@:native("on_take")
	var onTake : InvRef->String->Int->Any->String->Void;
}
