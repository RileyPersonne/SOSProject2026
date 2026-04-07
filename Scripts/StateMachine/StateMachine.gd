class_name StateMachine
extends Node


@export var initial_state: State = null

@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

func _ready() -> void:
	await owner.ready
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(transition)
	state.enter("")
	
	
func transition(target) -> void:
	if not has_node(str(target)):
		printerr(owner.name + " failed to transition to: ", target, " but it doesnt exist")
		return
	
	var prev = state.name
	state.exit()
	state = get_node(str(target))
	state.enter(str(prev))
	
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float) -> void:
	state.update(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
