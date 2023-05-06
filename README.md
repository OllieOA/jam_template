# Jam Template
Template for use in jams

## Version

Supports Godot 4.x

## Supplementary Components

### CI/CD with GitHub Actions

Using the GitHub Actions native CI/CD pipeline, we can automate pushing games to itch.io with some minimal setup. You will need to generate a [Butler API token](https://docs.butlerlabs.ai/reference/uploading-documents-to-the-rest-api) to utilise this.

Effectively, a containerised version of Godot is used to headlessly generate the builds and then the Butler API automatically pushes the builds to the jam page.

### Vault

A vault used with the Obsidian program, good for collective notes, but not great for live collaboration. Instead, one should be sure to use a tool like Google Jamboard or something rather than this, though it is available if preferred.

## Game Components

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