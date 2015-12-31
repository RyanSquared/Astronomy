# Astronomy
Framework for running cqueues-based MoonScript applications

## General Information

### Contributors

| Name            | Email                | GitHub Account |
| ------------------------------------------------------- |
| Charles Heywood | charles@hashbang.sh  | ChickenNuggers |

### Project Information

**Astronomy** is a MoonScript framework meant to provide a middleware to run
multiple [cqueues](https://github.com/wahern/cqueues) MoonScript or Lua
applications without running multiple Lua states.

### Dependencies

[LuaRocks](https://luarocks.org/) (Recommended)

[MoonScript](https://github.com/leafo/moonscript)
 (required for development releases only)

[Lua](http://www.lua.org)

[cqueues](https://github.com/wahern/cqueues)

## Getting Started

### Installing Dependencies with LuaRocks

It is assumed that users already have LuaRocks installed on their machine for
this process; LuaRocks installation instructions will not be included. If a user
does **not** have LuaRocks installed, they will have to manually go to the above
page for the depency and download the program manually. Users can pass the
"--local" flag to `luarocks install` so that libraries and binaries can be
installed locally.

```sh
$ luarocks install cqueues
$ luarocks install moonscript # Optional
```


