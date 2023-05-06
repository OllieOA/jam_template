extends Control

@export var scenes: Array[PackedScene] = []
@onready var transition_animator = $"%transition_animator" as AnimationPlayer
@onready var scene_block = $"%scene_block" as ColorRect

var _scene_dict = {}
var _current_scene: Node
var _next_scene: PackedScene

const transition_shaders := {
	"fade": preload("res://ui/shaders/fade_shader.tres"),
	"wipe": preload("res://ui/shaders/wipe_shader.tres"),
	"vignette": preload("res://ui/shaders/vignette_shader.tres"),
}

func _ready() -> void:
	var root = get_tree().get_root()
	_current_scene = root.get_child(root.get_child_count() - 1)
	transition_animator.connect("animation_finished", Callable(self, "_handle_animation_finished"))

	# Establish scenes	
	for scene in scenes:
		var scene_name: String = scene.get_state().get_node_name(0)
		_scene_dict[scene_name] = scene
		
	# Set up transition components
	scene_block.material = transition_shaders["fade"]
	transition_animator.play()


func goto_scene(name: String, transition_type: String = "fade", speed: float = 1.0) -> void:
	if transition_type in transition_shaders:
		var transition_shader = transition_shaders[transition_type]
		scene_block.material = transition_shader
	else:
		push_error("No transition with name %s" % transition_type)

	if name in _scene_dict:
		_next_scene = _scene_dict[name]
		transition_animator.playback_speed = speed
		transition_animator.play_backwards()
	else:
		push_error("Could not load scene with name %s" % name)


func _handle_animation_finished(_anim_name: String) -> void:
	if _next_scene != null:
		var _scene_change_result = get_tree().change_scene_to_packed(_next_scene)
		transition_animator.play()
		_next_scene = null
	else:
		push_error("Issue with loading scene")
