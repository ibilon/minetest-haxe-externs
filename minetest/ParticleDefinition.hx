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

typedef ParticleDefinition = {
	/** Starting position of the particle. **/
	var pos : Position;

	/** Particle velocity. **/
	var velocity : Position;

	/** Particle acceleration. **/
	var acceleration : Position;

	/** Particle disappears after `expirationTime` seconds. **/
	@:native("expirationtime")
	var expirationTime : Float;

	/** Particle size in meters. **/
	var size : Float;

	/** True if should collide with solid nodes, false if not. **/
	@:native("collisiondetection")
	var collisionDetection : Bool;

	/** If it's set to true, particles are removed when colliding (requires `collisionDetection`). **/
	@:native("collision_removal")
	var collisionRemoval : Bool;

	/** Limit to vertical axis (useful for rain). **/
	var vertical : Bool;

	/** Specify particle self-luminescence in darkness. (optional) **/
	@:optional
	var glow : Float;

	/** Particle texture. **/
	var texture : String;

	/** Specifies how to animate the particle texture. (optional) **/
	@:optional
	var animation : TileAnimationDefinition;

	/** If specified, the particle is only spawned for the player with this name. **/
	@:optional
	@:native("playername")
	var playerName : String;
}
