# Externs for the Minetest modding API

**This is a work in progress** Very few functions are present in the extern.

Haxe externs for the game [Minetest](http://www.minetest.net/) modding API.
See <http://dev.minetest.net/Intro> for the documentation on how to make a mod.

Using these externs require the <https://github.com/HaxeFoundation/haxe/pull/6348> pull request,
and will automatically add the `-D lua-alias-string`.
This is required for your mod to not break some common functions provided by Minetest.

## Installation

Clone this repository and do:
```
haxelib dev minetest /path/to/repository
```

## Usage

Simply add `-lib minetest` to your build command/hxml.

The externs follow as closely as possible the lua API provided by Minetest.
Some differences are necessary to provide a type safe API without runtime mismatch.

## Example

```haxe
import minetest.Minetest;

class Main
{
	public static function main ()
	{
		Minetest.addEntity({ x: 0, y: 10, z: 0 }, "mobs:sheep");
	}
}
```

Can be compiled with `haxe -main Main -lib minetest -lua init.lua`.

## License

The externs are licensed under the MIT license, see `LICENSE.md`.

Minetest source code is under the LGPL 2.1 or later, see <https://github.com/minetest/minetest> for more details.
