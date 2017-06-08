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

typedef ParticleSpawnerDefinition = {
	/** Amount of particles. **/
	var amount : Int;

	/** Particle spawner stops after `time` seconds, use 0 for infinite lifespan. **/
	var time : Float;

	/** Minimal position. **/
	@:native("minpos")
	var minPositon : Position;

	/** Maximal position. **/
	@:native("maxpos")
	var maxPositon : Position;

	/** Minimal velocity. **/
	@:native("minvel")
	var minVelocity : Position;

	/** Maximal velocity. **/
	@:native("maxvel")
	var maxVelocity : Position;

	/** Minimal acceleration. **/
	@:native("minacc")
	var minAcceleration : Position;

	/** Maximal acceleration. **/
	@:native("maxacc")
	var maxAcceleration : Position;

	/** Minimal expiration time. **/
	@:native("minexptime")
	var minExpirationTime : Float;

	/** Maximal exploration time. **/
	@:native("maxexptime")
	var maxExpirarionTime : Float;

	/** Minimal particle size. **/
	@:native("minsize")
	var minSize : Float;

	/** Maximal particle size. **/
	@:native("maxsize")
	var maxSize : Float;

	/** If true particles collide with solid blocks, if false they do not. **/
	@:native("colissiondetection")
	var colissionDetection : Bool;

	/** Limit particles to vertical axis only (useful for rain). **/
	var vertical : Bool;

	/** Particle texture. **/
	var texture : String;

	/** If specified, the particles are only spawned for the player with this name. **/
	@:native("playername")
	@:optional
	var playerName : String;
}
