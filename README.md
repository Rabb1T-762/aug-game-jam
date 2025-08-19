# 🎮 Game Jam Starter Template

## 🏁 Welcome to our Game Jam!
> Welcome, everyone! This template is your launching pad to make your first game. Use it to learn, experiment, and have fun!

We’re keeping it simple, creative, and classic:  

**Your mission:**  
**Build a 2D platformer where the player gets from Point A to Point B!**  
That’s it. The rest? That’s up to you.

- Is your game a side scroller or a vertical challenge? Your choice!
- What obstacles, puzzles, or surprises block the path? You decide!
- Will you have enemies, moving platforms, collectibles, or weird gravity? Yes, please! Or… maybe not? It’s all yours to shape.

**The only rule:**  
There must be a clear start and finish.  
Everything between those two points is your playground.

**Why This Scope?**  
- So you can focus on adding your own creative touches - from level design, unique mechanics, story telling, or whatever you like!
- So you’ll have a “complete” game by the end, no matter how wild it gets in the middle!

Let your imagination run wild—make it funny, challenging, or totally absurd. We can’t wait to see how you fill the space between A and B!

## 🎉 Game Jam Details
### Theme
> Point A to Point B. 

Build a 2D platformer where the player’s goal is to travel from a clear starting point to a finish—by any creative means you invent!

### Dates
> 12 August 2025 – 9 September 2025

Be on the lookout for announcements and updates on Discord!

### Teams 
> Solo or as many as you like!

Want to fight this battle by yourself? Be the lone hero—show us what you’ve got!
Or fancy a fierce team who fights this war together? Build up your crew, have each other’s backs, and show us the power of collaboration. Whether solo or with friends, connect, experiment, and have fun!

---

## 📁 What’s in the Template?

- Basic running game
- State machine
- Character with preloaded sprites/assets
- Simple physics
- Demo world

---

## Running The Sample Game
We have an example of a side scroller that you can have a look at. 

The sample is in `scenes/example.tscn`

Simply double click the file in the file explorer to open it. 

Then hit F6 to play the current scene, or click the "Run Current Scene" button in the ribbon menu in the right top corner of Godot's window. 

This example is the completed tutorial from [Brackeys Godot Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0&t) with the character controller updated to use a state machine. Feel free to use this as a reference. 

## Starter Game Scene
We have `scenes/game.tscn` which has a player character and the tile map loaded, so you can just start building your world if you want to use the included tile set. 

## 💡 Quick Guide to Game Components

## 1. 🟩 State Machine

Think of your game character as having different moods:
- Chill (Idle)
- Energetic (Run)
- Adventurous (Jump)
- Oh no, I’m falling! (Airborne)

A state machine is like a director telling your character which mood they’re in and making sure they act accordingly.

Instead of stuffing all your logic into one giant script, each state (mood) has its own little script. The state machine decides which one is active at any given moment.

### 1.1 The Base State

state.gd is like a template.
It has functions ready for you to fill in when creating new states:

- enter() – Runs once when you switch into this state.
- exit() – Runs once when you leave this state.
- physics_update() – Runs every physics frame (movement, collisions).
- handle_input() – Handles player input in this state.

Example: When you enter Idle, you might stop movement and play the idle animation.

### 1.2 The State Machine
state_machine.gd is the director.

The state machine: 
- Finds all your state scripts (Idle, Run, Jump…)
- Keeps track of the current state
- Passes your player and animations to the states
- Listens for “Hey! Switch!” signals from states
- Handles smooth transitions between them

This way, only one state is in charge at a time.

### 1.3 The States Themselves
Each state is its own script that extends state.gd

Some examples of different states are: Idle State, Run State, Jump State, Airborne State. But you can take it even further! You can add states for attacking, blocking, climbing, and so much more. Be creative and show us what you've got!

All you have to do is:
- Create a new script that extends state.gd
- Override the functions you need
- Add it as a child of the StateMachine in your scene
- Use transitioned.emit("state_name") to switch

State machines keep your code clean because each state only cares about its own behavior. No more giant if-else tangles—just smooth, organized game logic.

If you have any further questions about state machines, find your own resources/videos tutorials or use the link below:
[Finite State Machine Pattern](https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/)


## 2. 🏁 Start & End Logic

The game jam’s theme is simple and classic: get from Point A to Point B.
Everything else is your playground. 

🎯 Point A — Where do we spawn?
Pick a spawn point so the player always knows where the journey begins.

🧭 Point B — What counts as “the end”?
You choose! Point B can be a door, a flag, or just a location on the map. Use your creative freedom to allow the player to find Point B!

Single Level or Multi-Level? Your call.
- Single Level: When the goal triggers, show a congratulations screen or restart.
- Multi-Level: Have multi PointA - PointB stages. 

## 3. 🌍 World Building

🎥 Tutorial reference: [Watch the relevant part of the video](https://www.youtube.com/watch?v=LOhfqjmasi0&t)

This is a small Godot tutorial that uses the same assets as this project. The Game scene in this project used that tutorial as a base.

We have included some basic assets and scenes with the project. Feel free to use them as is or add/create your own. 

You can use the Game scene as an example on how to use the assets. 

### Create a new scene (your level or asset)
1. **Scene → New Scene** (or press `Ctrl+N`).
2. Choose a 2D root (`Node2D` / `@2D Scene`) and name it something like `Level1` or `TestArena`.
3. Save the scene to the scenes folder.

Scenes are how you create reusable assets for your game. They are a collection of nodes or other scenes. 

So, to create your game you create a scene and add nodes and scenes until you have the result you want. 

Here's how to use the scenes and assets in the project.

#### Step #1: Adding Your Player Character
Add a player scene to your main scene. 
- Drag the palyer.tscn from the `/scenes` directory into your open scene.
If you want the camera to follow the player - like in our Game scene - add a Camera2D node to the player in your scene.

A basic movement script with a state machine is already attached so movement can be done with WASD. 
There are also basic animations attached. 

#### Step #2: Building The Map
To add your map you use TileMapLayer nodes for each layer you want. I reccommend adding a node2D called something like "TileMaps" and adding the TileMapLayer nodes as children for organisation. 

In the YouTube tutorial they use a TileMap node. You can still do this and follow along with the tutorial, but the TileMap is deprecated and you will have a warning next to the node stating that you should extract your TileMap into separate TileMapLayer nodes. 

##### Adding your Tile Set
The tile set is located at `assets\brackeys_platformer_assets\sprites\world_tileset.png`. 
If you want to use your own tile set the process is the same. 

Add a TileMapLayer node 

Select the node: In the Inspector you'll see a property labled Tile Set. 
Click the little arrow and from the dropdown select "New TileSet"

If you click on the TileSet you just created it will expand and show it's properties. If you're using your own tile set you may have to configure your grid size to match your tile set. 
Check the bookmark labled "World Building 1.0" in the tutorial to see it done. 

Now in the bottom window of Godot you should see a toolbar Here you should see the lables "TileMap" and "TileSet" 

This is where you manage your tile set.
Here click on the "Tile Set" tab and drag the tile set you want to load into the window. 
Godot will do its best to detect your tiles and set it up. 
You can manually remove tiles by clicking the erasor icon. 
You can create larger tiles by shift clicking and draging. 

Next you'll want to create the physics layer mask for your tiles. 
To do this click on your TileMapLayer and then click on the TileSet property to expand the options in the inspector. 
Here you will see a property "Physics Layers". Click that to expand it and click "add element" to add a physics layer. 
Now go back to your tile set tab and click on "Paint". Then select the Physics layer you created as the property to paint. 
Now paint the physics layer onto all relevant tiles. 

Now you're  ready to paint your tile map onto your scene. 
Go to the tile map select the tile/tiles you want to paint by selecting the paint tool and clicking on the tiles you want to paint. Shift+click to select multiple. 

Have fun building your world!


## 4. ⚙️ Physics
The physics of this template is very simple and -like most things- are handled via the state machine.

The only entity with explicit physics is the player. However, the player itself doesn't define any of its physics, it simply delegates the physics to the relevant state (falling, running, etc.).

The collision between the player and objects in the world is handled implicitly, using Godot's tileset and the **CharacterBody2D**.

In order to change the physics, it is simply necessary to implement a 'physics_update' method on the desired state. Each state has access to the **CharacterBody2D** - which provides a lot of functionality. 

See https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html. 

Each state also has access to an **AnimatedSprite2D**, so each state can also change animations (like flipping the sprite when changing direction). This will be covered in more detail in the next heading.

The 'physics_update' method is called on every frame by the state machine. So whatever desired physics should be in those methods.

For example:
```
func physics_update(delta: float) -> void:
    # Handle transition to Airborne state
    if not character_body.is_on_floor():
        transitioned.emit("airborne")
        return

    var direction := Input.get_axis("move_left", "move_right")

    # Handle transition to Run state
    if direction != 0:
        transitioned.emit("run")

    character_body.move_and_slide()
```


The 'physics_update' method on the _Idle_ state handles possible transition to the _Airborne_ and _Run_ states and then calls the 'move_and_slide' to handle collision physics every frame.

This same method on the _Airborne_ state then handles the physics for falling.

There is a _Jump_ state, that really only ought to apply the jump force and then immediately transition to the _Airborne_ state. Currently, the _Jump_ state depends on the JUMP_VELOCITY defined on the player. So if you wish to play with the jump height (or in fact, the player's movement speed), be sure to do so on the player. This way, you could also add other entities, each perhaps with their own movement speed or jump force - all while still being handled by the same states.

Since you have freedom to also add more states, feel free to extend this as far as you wish.

If you wish to take a completely different approach with your physics, be sure to peruse Godot's documentation on what's available to you (and good luck): 

[Physics Tutorials](https://docs.godotengine.org/en/stable/tutorials/physics/index.html)

## 5. 🎨 Animations, Assets, & Sprites 
Even though adding a sprite or asset in Godot can be as simple as dragging an imported image onto a node, since this project already has a state machine implemented, the sprites and animations on entities are also handled through the state machine.

If you look at the player scene, you'll notice an AnimatedSprite2D attached to the Player node. This AnimatedSprite2D has different animation frames for each of the possible states on the player.

This means that you can have unique animations for each of the different states, like idle animation, falling animation, etc.

In order to replace the existing sprites, you would need to simply import your own sprites in an image format supported by Godot. See [Importing Images](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_images.html)
Remember that you will need a single sprite for every frame of animation you desire. You can look at the asset for the player ("knight.png") for reference.

Set up each of the states on the AnimatedSprite2D with the correct animation frames. If your state machine is set up properly, you should see the correct results right away. You can also add more states and more animations if you wish.

If you're not sure how to get started, see [Godot Introduction](https://docs.godotengine.org/en/stable/tutorials/animation/introduction.html).

There are many ways of handling these aspects of the game, so if you'd rather take your own approach, then please peruse the Godot documentation for help: [Godot Animation](https://docs.godotengine.org/en/stable/tutorials/animation/index.html) 

NOTE: As this template is based largely on an existing tutorial, if you're wondering where the current assets came from, see [Brackeys Godot Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0&t).

---

## 📚 Resources

- [Finite State Machine Pattern](https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/)
- [Brackeys Godot Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0&t)
- [Brackeys Platformet Asset Bundle](https://brackeysgames.itch.io/brackeys-platformer-bundle)
- [Characterbody2s Docs](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html)
- [Physics Tutorials](https://docs.godotengine.org/en/stable/tutorials/physics/index.html)
- [Importing Images](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_images.html)
- [Godot Introduction](https://docs.godotengine.org/en/stable/tutorials/animation/introduction.html) 
- [Godot Animation](https://docs.godotengine.org/en/stable/tutorials/animation/index.html)

---

## 🙌 Good Luck!