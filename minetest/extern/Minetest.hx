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

import lua.Table.AnyTable;
import minetest.extern.AutoConvLuaTable as Table;

@:native("minetest")
extern class Minetest
{
	public static function add_entity (pos:Position, name:String) : ObjectRef;

	@:overload(function (pos:Position, name:AnyTable) : ObjectRef {})
	@:overload(function (pos:Position, name:ItemStack) : ObjectRef {})
	public static function add_item (pos:Position, name:String) : ObjectRef;

	public static function add_node_level (pos:Position, level:Int=1) : Int;

	public static function add_particle (particle_definition:ParticleDefinition) : Void;

	public static function add_particlespawner (particlespawner_definition:ParticleSpawnerDefinition) : String;

	public static function after (time:Float, fn:Void->Void) : Void;

	public static function auth_reload () : Void;

	public static function ban_player (name:String) : Void;

	public static function chat_send_all (text:String) : Void;

	public static function chat_send_player (name:String, message:String) : Void;

	public static function check_player_privs (name:String, privs:Table<String, Bool>) : PlayerPrivileges;

	public static function clear_craft (recipe:CraftRecipe) : Void;

	public static function clear_objects () : Void;

	//TODO:
	public static function compress () : Void;

	public static function create_detached_inventory (name:String, callbacks:DetachedInventoryDefinition) : InvRef;

	public static function create_schematic (p1:Position, p2:Position, probability_list:Array<{ pos:Position, prob:Int }>, filename:String, slice_prob_list:Array<{ ypos:Int, prob:Int }>) : Void;

	public static function debug (line:String) : Void;

	public static function decode_base64 (base64:String) : String;

	//TODO:
	public static function decompress () : Void;

	public static function delete_area (pos1:Position, pos2:Position) : Void;

	public static function delete_particlespawner (id:String, ?playerName:String) : Void;

	public static function deserialize (string:String) : AnyTable;

	public static function dig_node (pos:Position) : Void;

	//TODO: return type
	public static function dir_to_facedir (dir:Position, is6d:Bool=false) : Any;

	//TODO: return type
	public static function dir_to_wallmounted (dir:Position) : Any;

	public static function do_item_eat (hpChange:Int, replaceWithItem:Item, itemStack:ItemStack, user:String, pointedThing:String) : ItemStack;

	public static function emerge_area (pos1:Position, pos2:Position) : Void;

	public static function encode_base64 (string:String) : String;

	public static function explode_scrollbar_event (string:String) : { type:String, value:Int };

	public static function explode_table_event (string:String) : { type:String, row:Int, column:Int };

	public static function explode_textlist_event (string:String) : { type:String, index:Int };

	//TODO: check facedir type
	public static function facedir_to_dir (facedir:Int) : Position;

	@:overload(function (pos:Position, radius:Int, nodenames:Table<Int, String>) : Position {})
	public static function find_node_near (pos:Position, radius:Int, nodenames:String) : Position;

	@:overload(function (minp:Position, maxp:Position, nodenames:Table<Int, String>) : Table<Int, Position> {})
	public static function find_nodes_in_area (minp:Position, maxp:Position, nodenames:String) : Table<Int, Position>;

	//TODO: check algorithm type
	public static function find_path (pos1:Position, pos2:Position, searchdistance:Int, max_jump:Int, max_drop:Int, algorithm:String="A*_noprefetch") : Table<Int, Position>;

	public static function forceload_block (pos:Position) : Bool;

	public static function forceload_free_block (pos:Position) : Void;

	public static function formspec_escape (string:String) : String;

	//TODO: check if field is named method or type
	public static function get_all_craft_recipes (query_item:{ method:String, width:Int, items:Table<Int, String>, output:String }) : Table<Int, CraftRecipe>;

	public static function get_ban_description (ip_or_name:String) : String;

	public static function get_ban_list () : String;

	public static function get_connected_players () : Table<Int, ObjectRef>;

	public static function get_content_id (name:String) : Int;

	//TODO: check if field is named method or type
	public static function get_craft_recipe (item:String) : { width:Int, method:String, item:Table<Int, String> };

	//TODO: multireturn
	public static function get_craft_result (input:{ method:String, width:Int, items:Table<Int, String> }) : ;

	public static function get_current_modname () : String;

	public static function get_day_count () : Int;

	//TODO: type of tool_capabilities
	public static function get_dig_params (groups:Table<Int, String>, tool_capabilities:AnyTable, ?time_from_last_punch:Float) : { diggable:Bool, time:Float, wear:Int };

	public static function get_gametime () : Int;

	@:overload(function (location:{ type:String, pos:Position}) : InvRef {})
	public static function get_inventory (location:{ type:String, name:String}) : InvRef;

	public static function get_item_group (name:String, group:String) : Int;

	public static function get_mapgen_object (objectname:String) : MapGen;

	public static function get_meta (pos:Position) : NodeMetaRef;

	public static function get_mod_storage () : StorageRef;

	public static function get_modnames () : Table<Int, String>;

	public static function get_modpath (name:String) : String;

	public static function get_name_from_content_id (content_id:Int) : String;

	public static function get_node (pos:Position) : Node;

	public static function get_node_drops (node_name:String, ?tool_name:String) : Table<Int, String>;

	public static function get_node_level (pos:Position) : Int;

	public static function get_node_light (pos:Position, ?timeofday:Float) : Int;

	public static function get_node_max_level (pos:Position) : Int;

	public static function get_node_or_nil (pos:Position) : Node;

	public static function get_node_timer (pos:Position) : NodeTimerRef;

	public static function get_objects_inside_radius (pos:Position, radius:Int) : Table<Int, ObjectRef>;

	public static function get_password_hash (name:String, raw_password:String) : String;

	public static function get_perlin (seeddiff:Int, octaves:Int, persistance:Float, scale:Int) : PerlinNose;

	//TODO
	public static function get_perlin_map () : ;

	public static function get_player_by_name (playername:String) : PlayerObject;

	public static function get_player_information (playername:String) : { address:String, ip_version:Int, min_rtt:Float, max_rtt:Float, avg_rtt:Float, min_jitter:Float, max_jitter:Float, connection_uptime:Int };

	public static function get_player_ip (name:String) : String;

	public static function get_player_privs (name:String) : Table<String, Bool>;

	//TODO
	public static function get_player_radius_area () : ;

	//TODO: check type of pointed_thing
	public static function get_pointed_thing_position (pointed_thing, above:Bool) : Position;

	public static function get_position_from_hash (hash:Int) : Position;

	public static function get_server_status () : String;

	public static function get_timeofday () : Float;

	public static function get_us_time () : Float;

	public static function get_voxel_manip (?p1:Position, ?p2:Position) : VoxelManip;

	public static function get_worldpath () : String;

	public static function global_exists (name:String) : Bool;

	public static function handle_node_drops (pos:Position, drops:Table<Int, String>, digger:ObjectRef) : Void;

	//TODO: multi return
	@:overload(function (arg:Table<String, Bool>) {})
	public static function has_feature (arg:String) : ;

	public static function hash_node_position (pos:Position) : Int;

	//TODO: type of hud_definition, formspec string?
	public static function hud_replace_builtin (name:String, hud_definition) : Void;

	public static function inventorycube (img1:String, img2:String, img3:String) : String;
}
