## Astronomy // API

## Functions

###`loop(break_on_failure)`

**Description**

Begins the cqueues loop.
Returns true if all coroutines peacefully exited;
returns false otherwise after all coroutines are done.
If given the break_on_failure option, breaks on the
first routine terminated by error.

**Parameters**

 * *break_on_failure*: A truthy/falsey value to stop the loop if a routine fails

**Returns**

 * _true_|_false_: Success value of routines

**MoonScript**

```moonscript
success = astronomy\loop!
assert success
```

**Lua**

```lua
local success = astronomy:loop()
assert(success)
```

---

###`attach(coroutine)`

**Description**

Attach a coroutine onto the cqueues queue and "prepare it for battle".
Generally, anything done with cqueues that does any blocking operation
should be attached via this method or through `wrap()`.

**Parameters**

 * *coroutine*: A Lua coroutine

**Returns**

 * *nil*

**MoonScript**

```moonscript
astronomy\attach coroutine.create ->
	while true do
		cqueues.sleep 5
		Logger.print 'Yay, sleep!'
```

**Lua**

```lua
astronomy:attach(coroutine.create(function()
	while true do
		cqueues.sleep(5)
		Logger.print("Yay, sleep!")
	end
end))
```

---

###`wrap(func)`

**Description**

Wraps a function as a coroutine and adds the new coroutine
to the cqueues queue object. As with attach(), this should
be done for any blocking operations.

**Parameters**

 * *func*: Function to wrap

**Returns**

 * *nil*

**MoonScript**

```moonscript
astronomy\wrap ->
	while true do
		cqueues.sleep 5
		Logger.print 'Yay, sleep!'
```

**Lua**

```lua
astronomy:wrap(function()
	while true do
		cqueues.sleep(5)
		Logger.print("Yay, sleep!")
	end
end))
```
