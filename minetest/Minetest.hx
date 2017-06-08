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

import minetest.AutoConvLuaTable as Table;

/**
Main entry point for the modding API.
**/
@:native("minetest")
extern class Minetest
{
	/**
	Spawns `LuaEntitySAO` at `pos. Returns `ObjectRef` or null if failed.
	@param name Entity name.
	**/
	@:native("add_entity")
	public static function addEntity (pos:Position, name:String) : ObjectRef;

	/**
	Spawns item in the world at `pos`. Returns `ObjectRef` or null if failed.
	**/
	//TODO: name could also be table? http://dev.minetest.net/minetest.add_item
	@:native("add_item")
	@:overload(function (pos:Position, name:String) : ObjectRef {})
	public static function addItem (pos:Position, name:ItemStack) : ObjectRef;

	/**
	Increases the level of leveled node (water, snow etc.) by level. If totallevel > maxlevel it returns the rest (total - max). Can be negative to decrease.
	@param level Node level 0 - 63 (default = 1)
	**/
	@:native("add_node_level")
	public static function addNodeLevel (pos:Position, level:Int=1) : Int;

	/**
	Spawns a particle at the specified position. If you want to spawn multiple particles, use `addParticlespawner`.
	**/
	@:native("add_particle")
	public static function addParticle (particle:ParticleDefinition) : Void;

	/**
	Add a particlespawner, an object that spawns an amount of particles over time.
	**/
	@:native("add_particlespawner")
	public static function addParticlespawner (spawner:ParticleSpawnerDefinition) : Void;

	/**
	This calls a function after `time` seconds. It can also be used to add a function to the end of the queue of functions becoming executed by minetest.

	Tip: if your function has parameter you can bind them, see <https://haxe.org/manual/lf-function-bindings.html>.
	**/
	public static function after (time:Float, fn:Void->Void) : Void;

	/**
	Calls `getAuthHandler().reload()`.
	**/
	//TODO: get_auth_handler isn't in the method list, so not sure what reload is returning, using Void for now.
	@:native("auth_reload")
	public static function authReload () : Void;

	/**
	Ban a player.
	@param name Player name
	**/
	@:native("ban_player")
	public static function banPlayer (name:String) : Void;

	/**
	Send a chat message to all players.
	@param message Text of the message
	**/
	@:native("chat_send_all")
	public static function chatSendAll (message:String) : Void;

	/**
	Send a chat message to a specific player.
	@param name Player name
	@param message Text of the message
	**/
	@:native("chat_send_player")
	public static function chatSendPlayer (name:String, message:String) : Void;

	/**
	Check privileges of a player. Returns a boolean and a list of missing privileges.
	You can pass a Map<String, Bool> for `priv`, there is automatic convertion.
	@param name Player name
	@param privs List of boolean permissions
	**/
	@:native("check_player_privs")
	public static function checkPlayerPrivs (name:String, privs:Table<String, Bool>) : PlayerPrivs;

	/**
	Will erase existing craft based either on output item or on input recipe.
	Specify either output or input only. If you specify both, input will be ignored. For input use the same recipe table syntax as for `registerCraft`.
	For output specify only the item, without a quantity.
	If no erase candidate could be found, Lua exception will be thrown.
	Warning! The type field ("shaped","cooking" or any other) will be ignored if the recipe contains output. Erasing is then done independently from the crafting method.
	**/
	@:native("clear_craft")
	public static function clearCraft (recipe:CraftRecipe) : Void;

	/**
	Deletes all objects in the environment.
	**/
	@:native("clear_objects")
	public static function clearObjects () : Void;

	/**
	**/
	//TODO:
	public static function compress () : Void;

	/**
	**/
	@:native("create_detached_inventory")
	public static function createDetachedInventory (name:String, callbacks:DetachedInventoryCallbacks) : InvRef;

	/**
	**/
	//TODO:
	@:native("create_schematic")
	public static function createSchematic () : Void;

	/**
	Always printed to stderr and logfile.
	**/
	public static function debug (line:String) : Void;
}
