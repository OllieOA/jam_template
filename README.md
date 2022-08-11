# Jam Template
Template for use in jams

## Components

### This README.md

Add your attributions here
  - Music
    - [Some music](link_to_music)
  - Sound Effects
    - [Some SFX](link_to_sfx)
  - Art
    - [Some art](link_to_art)
  - Plugins and code
    - [Some plugin](link_to_plugin)

### Scene Manager
This is an Autoload that supports scene transitions. To use it, you load up the scenes you want to support in the "scenes" array (note that it is expected that scenes are uniquely named).

Then, call `SceneManager.goto_scene(<scene_name>, <transition>, <speed>)` where transitions are:
- `"fade"` (default)
- `"vignette"`
- `"wipe"`

and speed is the animation playback speed (i.e. animation will complete in `1/speed` seconds).

Note that transitions appear and disappear (i.e. animation plays forward, then reversed)