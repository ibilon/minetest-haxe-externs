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
	public static function get_craft_result (input:{ method:String, width:Int, items:Table<Int, String> }) : Void;

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

	public static function get_perlin (seeddiff:Int, octaves:Int, persistance:Float, scale:Int) : PerlinNoise;

	//TODO
	public static function get_perlin_map () : Void;

	public static function get_player_by_name (playername:String) : Player;

	public static function get_player_information (playername:String) : { address:String, ip_version:Int, min_rtt:Float, max_rtt:Float, avg_rtt:Float, min_jitter:Float, max_jitter:Float, connection_uptime:Int };

	public static function get_player_ip (name:String) : String;

	public static function get_player_privs (name:String) : Table<String, Bool>;

	//TODO
	public static function get_player_radius_area () : Void;

	public static function get_pointed_thing_position (pointed_thing:PointedThing, above:Bool) : Position;

	public static function get_position_from_hash (hash:Int) : Position;

	public static function get_server_status () : String;

	public static function get_timeofday () : Float;

	public static function get_us_time () : Float;

	public static function get_voxel_manip (?p1:Position, ?p2:Position) : VoxelManip;

	public static function get_worldpath () : String;

	public static function global_exists (name:String) : Bool;

	public static function handle_node_drops (pos:Position, drops:Table<Int, String>, digger:ObjectRef) : Void;

	//TODO: multi return
	@:overload(function (arg:Table<String, Bool>) : Void {})
	public static function has_feature (arg:String) : Void;

	public static function hash_node_position (pos:Position) : Int;

	public static function hud_replace_builtin (name:String, hud_definition:String) : Void;

	public static function inventorycube (img1:String, img2:String, img3:String) : String;

	public static function is_protected (pos:Position, playername:String) : Bool;

	public static function is_singleplayer () : Bool;

	public static function is_yes (arg:String) : Bool;

	public static function item_drop (itemstack:ItemStack, dropper:Player, pos:Position) : Void;

	public static function item_eat (hp_change:Int, ?replace_with_item:String) : Void;

	public static function item_place (itemstack:ItemStack, placer:ObjectRef, pointed_thing:PointedThing, param2:Int) : Void;

	public static function item_place_node (itemstack:ItemStack, placer:ObjectRef, pointed_thing:PointedThing, param2:Int) : Void;

	public static function item_place_object (itemstack:ItemStack, placer:ObjectRef, pointed_thing:PointedThing) : Void;

	public static function kick_player (name:String, ?reason:String) : Void;

	//TODO: multireturn
	public static function line_of_sight (pos1:Position, pos2:Position, stepsize:Int=1) : Void;

	public static function log (loglevel:String, ?line:String) : Void;

	public static function node_dig (pos:Position, node:Node, digger:ObjectRef) : Void;

	public static function node_punch (pos:Position, node:Node, player:ObjectRef, pointed_thing:PointedThing) : Void;

	public static function notify_authentication_modified (?name:String) : Void;

	//TODO: redefinition type
	public static function override_item (name:String, redefinition:AnyTable) : Void;

	public static function parse_json (string:String, ?nullvalue:Any) : AnyTable;

	public static function place_node (pos:Position, node:String) : Void;

	public static function place_schematic (pos:Position, schematic:String, ?rotation:String, replacements:Table<String, String>, force_placement:Bool) : Void;

	public static function player_exists (name:String) : Bool;

	public static function pos_to_string (pos:Position) : String;

	public static function privs_to_string (privs:Table<String, Bool>) : String;

	public static function punch_node (pos:Position) : Void;

	//TODO
	public static function raillike_group () : Void;

	public static function record_protection_violation (pos:Position, name:String) : Void;

	public static function register_abm (abm_defintion_table:{ label:String, nodenames:Table<Int, String>, neighbors:Table<Int, String>, interbal:Float, chance:Float, catch_up:Bool, action:Position->Node->Int->Int->Void }) : Void;

	public static function register_alias (name:String, convert_to:String) : Void;

	//TODO
	public static function register_authentication_handler () : Void;

	//TODO: func return is multireturn
	public static function register_chatcommand (cmd:String, chatcommand_defnition:{ params:String, description:String, ?privs:Table<String, Bool>, func:String->String->Bool }) : Void;

	public static function register_craft (craft_recipe:CraftRecipe) : Void;

	public static function register_craft_predict (func:ItemStack->Player->CraftRecipe->InvRef->Void) : Void;

	public static function register_craftitem (name:String, item_definition:{ description:String, groups:Table<Int, String>, inventory_image:String, wield_image:String, stack_max:Int, liquids_pointable:Bool, metadata:Any, on_place:ItemStack->ObjectRef->PointedThing->ItemStack, on_drop:ItemStack->ObjectRef->Position->ItemStack, on_use:ItemStack->Player->PointedThing->ItemStack }) : Void;

	//TODO: schematic can be table
	public static function register_decoration (decoration_definition:{ deco_type:String, place_on:String, sidelen:Int, fill_ratio:Float, noise_params:{ offset:Int, scale:Float, spread:Position, seed:Int, octaves:Int, persist:Float }, biomes:Table<Int, String>, decoration:String, height:Int, height_max:Int, spawn_by:String, num_spawn_by:Int, schematic:String, replacements:Table<String, String>, flags:String, rotation:String }) : Void;

	public static function register_entity (entity_name:String, entity_definition:LuaEntityProperties) : Void;

	public static function register_globalstep (fn:Float->Void) : Void;

	public static function register_lbm (lbm_definition_table:{ index:String, nodenames:Table<Int, String>, run_at_every_load:Bool, action:Position->Node->Void }) : Void;

	public static function register_node (name:String, node_definition:NodeDefinition) : Void;

	public static function register_on_chat_message (fn:String->String->Void) : Void;

	public static function register_on_cheat (fn:ObjectRef->{ type:String }->Void) : Void;

	public static function register_on_craft (fn:ItemStack->Player->Table<Int, Table<Int, String>>->InvRef->ItemStack) : Void;

	public static function register_on_dieplayer (fn:ObjectRef->Bool) : Void;

	public static function register_on_dignode (fn:Position->Node->ObjectRef->Void) : Void;

	public static function register_on_generated (fn:Position->Position->Int->Void) : Void;

	//TODO: type of modifier
	public static function register_on_player_hpchange (fn:Player->Int->Void, modifier:Any) : Void;

	public static function register_on_item_eat (fn:Int->?ItemStack->ItemStack->Player->PointedThing->Void) : Void;

	public static function register_on_joinplayer (fn:Player->Void) : Void;

	public static function register_on_leaveplayer (fn:ObjectRef->Void) : Void;

	public static function register_on_mapgen_init (fn:MapGenParams->Void) : Void;

	public static function register_on_newplayer (fn:Player->Void) : Void;

	public static function register_on_placenode (fn:Position->Node->ObjectRef->Node->ItemStack->PointedThing->Bool) : Void;

	public static function register_on_player_receive_fields (fn:Player->String->Table<String, String>->Bool) : Void;

	public static function register_on_prejoinplayer (fn:String->String->String) : Void;

	public static function register_on_protection_violation (fn:Position->String->Void) : Void;

	public static function register_on_punchnode (fn:Position->Node->ObjectRef->PointedThing->Void) : Void;

	public static function register_on_respawnplayer (fn:ObjectRef->Bool) : Void;

	public static function register_on_shutdown (fn:Void->Void) : Void;

	public static function register_ore (ore_def:OreDefinition) : Void;

	@:overload(function (name:String, privilege_definition:{ description:String, give_to_singleplayer:Bool }) : Void {})
	public static function register_privilege (name:String, privilege_definition:String) : Void;

	//TODO check tooldefinition
	public static function register_tool (name:String, tool_definition:{ description:String, inventory_image:String, tool_capabilities:{ max_drop_level:Int, groupcaps:Table<String, { times:Table<Int, Float>, uses:Int, maxlevel:Int }> } }) : Void;

	public static function remove_node (pos:Position) : Void;

	public static function request_shutdown () : Void;

	public static function rollback_get_node_actions (pos:Position, range:Int, seconds:Int, limit:Int) : Table<Int, { actor:String, pos:Position, time:Int, oldnode:Node, newnode:Node }>;

	//TODO: maybe multireturn
	public static function rollback_revert_actions_by (actor:String, seconds:Int) : Void;

	public static function rotate_and_place (itemstack:ItemStack, placer:ObjectRef, pointed_thing:PointedThing, infinitestacks:Bool, ?orient_flags:{ invert_wall:Bool, force_wall:Bool, force_ceiling:Bool, force_floor:Bool, force_facedir:Bool }) : Void;

	public static function rotate_node (itemstack:ItemStack, placer:ObjectRef, pointed_thing:PointedThing) : Void;

	public static function serialize (data:AnyTable) : String;

	public static function set_gen_notify (flags:String) : Void;

	public static function set_mapgen_params (mapgen_params:{ mgname:String, seed:Int, water_level:Int, flags:String }) : Void;

	public static function set_node (pos:Position, node:{ name:String }) : Void;

	public static function set_node_level (pos:Position, level:Int=1) : Int;

	//TODO
	public static function set_noiseparam_defaults () : Void;

	public static function set_player_password (name:String, password_hash:String) : Void;

	public static function set_player_privs (name:String, privs:Table<String, Bool>) : Void;

	public static function set_timeofday (timeofday:Float) : Void;

	public static function setting_get (name:String) : String;

	public static function setting_get_pos (name:String) : Position;

	public static function setting_getbool (name:String) : Bool;

	public static function setting_save () : Void;

	public static function setting_set (name:String, value:String) : Void;

	public static function setting_setbool (name:String, value:Bool) : Void;

	public static function show_formspec (playername:String, formname:String, formspec:String) : Void;

	public static function sound_play (simplesoundspec:{ gain:Float, max_hear_distance:Int, loop:Bool }, soundparameters:{ to_player:String, pos:Position, object:ObjectRef }) : SoundHandle;

	public static function sound_stop (handle:SoundHandle) : Void;

	//TODO: check item's type
	public static function spawn_item (pos:Position, item:String) : ObjectRef;

	public static function spawn_tree (pos:Position, tree:Treedef) : Void;

	public static function splittext (text:String, charlimit:Int) : Table<Int, String>;

	public static function string_to_pos (string:String) : Position;

	public static function string_to_privs (string:String) : Table<String, Bool>;

	public static function swap_node (pos:Position, node:{ name:String }) : Void;

	public static function transforming_liquid_add (pos:Position) : Void;

	public static function unban_player_or_ip (name_or_ip:String) : Void;

	//TODO: multireturn
	public static function write_json (data:AnyTable, styled:Bool=false) : Void;
}
