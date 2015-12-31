## Astronomy // API

### Functions

##`log(message)`

**Description**

Useful for printing any form of messages.

**Parameters**

 * _message_: A string to be printed; may contain IRC-compatible color codes

**Returns**

 * _nil_

**MoonScript**

```moonscript
-- Example 1

astronomy = require 'astronomy'
astronomy.log 'Hello World!'

-- Example 2

with require 'alchemy'
	.log 'Hello World!'
```

**Lua**

```lua
-- Example 1

local astronomy = require("astronomy")
astronomy.log("Hello World!")

-- Example 2

require("astronomy").log("Hello World!")
```

---

##`append(routine)`

**Description**

Adds a routine onto the cqueues stack.

**Parameters**

 * _routine_: A function to be added to the cqueues stack

**Returns**

 * _nil_

**MoonScript**

```moonscript
astronomy.append(->
	astronomy = require 'astronomy'
	astronomy.log 'Hello World!'
)
```

**Lua**

```lua
astronomy.append(function()
	local astronomy = require("astronomy")
	astronomy.log("Hello World!")
end)
```

---

##`loop(break_on_failure)`

**Description**

Begins the cqueues loop.
Returns true if all coroutines peacefully exited;
returns false otherwise after all coroutines are done.
If given the breakOnFailure

**Parameters**

 * *break_on_failure*: A truthy/falsey value to break if a routine fails

**Returns**

 * _true_|_false_: Success value of routines
 * _string_: Error message

**MoonScript**

```moonscript
success, err = alchemy.loop!

if not success
	alchemy.log 'Error: ' .. err
```

**Lua**

```lua
local success, err = alchemy.loop()

if not success then
	alchemy.log("Error: " .. err)
end
```

### Values

| Name     | Value       | Description                 |
|----------|-------------|-----------------------------|
| reset    | `'\003'`    | Reset all colors            |
| success  | `'\00303'`  | (green) Success color code  |
| warn     | `'\00308'`  | (yellow) Warning color code |
| error    | `'\00304'`  | (red) Error color code      |
| fatal    | `'\00306'`  | (purple) Fatal color code   |
