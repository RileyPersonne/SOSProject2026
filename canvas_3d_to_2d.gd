extends Node3D

@onready var overlay: ColorRect = $CanvasLayer/ColorRect

var transitioning := false

func _ready():
	overlay.color = Color(0, 0, 0, 0)

func _input(event: InputEvent):
	if event is InputEventKey:
		if event.keycode == KEY_R and event.pressed and not transitioning:
			start_transition()

func start_transition():
	transitioning = true
	var tween = create_tween()
	tween.tween_property(overlay, "color", Color(0, 0, 0, 1), 0.8)
	tween.tween_callback(load_next_scene)

func load_next_scene():
	get_tree().change_scene_to_file("res://Scene/2d-scene.tscn")  # ← point back to your 2D scene
