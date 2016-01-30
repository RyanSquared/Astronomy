# Astronomy [![Build Status](https://travis-ci.org/ChickenNuggers/Astronomy.svg?branch=master)](https://travis-ci.org/ChickenNuggers/Astronomy)
Framework for running cqueues-based MoonScript applications

## General Information

### Contributors

| Name            | Email                | GitHub Account |
| ----------------|----------------------|--------------- |
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

[luafilesystem](https://github.com/keplerproject/luafilesystem)

[cqueues](https://github.com/wahern/cqueues)

[lua-logger](https://github.com/ChickenNuggers/lua-logger)

## Getting Started

### Installing Dependencies with LuaRocks

It is assumed that users already have LuaRocks installed on their machine for
this process; LuaRocks installation instructions will not be included. If a user
does **not** have LuaRocks installed, they will have to manually go to the above
page for the dependency and download the program manually. Users can pass the
`--local` flag to `luarocks install` so that libraries and binaries can be
installed locally.

```sh
$ luarocks install cqueues
$ luarocks install luafilesystem
$ luarocks install lua-logger
$ luarocks install moonscript # Optional
```

### Installing subprograms

The purpose of Astronomy is to run subprograms, or scripts that run in parallel
to another yet are independent. Astronomy also will (**TODO**) offer an API
that must be registered to be used by applications inside of Astronomy's
configuration files.

Programs are simple to install; most times users should be able to place a
folder inside of `./subprograms` and be done. However, some users might want to
give a program more permissions within Astronomy. Users should only need to
use `$ touch $PROGRAM_NAME.permissions` to give the program full-level
permissions within Astronomy.

#### Installing subprograms via git

Subprograms can be easily installed by simply cloning them into the `subprograms`
folder; updating all programs at once can be easily achieved by running `git
clone --recurse-submodules`.

## Subprograms

The simplest of subprograms should have a `main` function returned inside of
a table; this enables Astronomy to pass the cqueues queue to the program.

**MoonScript**

```moonscript
astronomy = require 'astronomy'
cqueues   = require 'cqueues'

main = (queue)->
 queue\wrap ->
  while true
   cqueues.sleep 5
   astronomy.log 'Yay, astronomy!'

return :main
```

**Lua**

```lua
local astronomy = require("astronomy")
local cqueues   = require("cqueues")

local function main(queue)
 queue:wrap(function()
  while true do
   cqueues.sleep(5)
   astronomy.log("Yay, astronomy!")
  end
 end)
end

return {main=main}
```
