# Yet Another Entity Component System

## What is YAECS?

While YAECS is inspired by the ECS paradigmn, though, it doesn't follow it strictly.
The project is the product of me messing around and creating an interesting system for my own games.

## How to contribute?

I value all contributions, even critique posted in issues are appreciated!

## How to use?

Start of by importing **YAECS** and  require the Registry code, then create a new instance and initialise it.
````lua
local Registry = require(YAECS["Registry"])

local registry = Registry.new()

registry:init()
````

We can then register components which we will pass to our entities later.
````lua
registry:registerComponent("Position", {
	x = 0,
	y = 0,
	z = 0,
})

registry:registerComponent("Color", {
	r = 0,
	g = 0,
	b = 0,
	a = 0,
})

````

We then register an entity with the name as the first paramater and the components in a table in the second parameters.
````lua
registry:registerEntity("rainbow part", { "Position", "Color" })
````

### todo

- [] The codebase is ripped from an uncomplete project years ago so the project is formatted quiet poorly. Such can be seen in my usage of OOP type lua classes when they aren't realy needed. We should refactor these.