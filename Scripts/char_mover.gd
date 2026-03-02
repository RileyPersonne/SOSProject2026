extends CharacterBody2D

@onready var _animation_player = self.get_node("AnimatedSprite2D")

const SPEED = 2
var dir = "down"
var idle = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#get input
	var h_direction = Input.get_axis("left", "right")
	var v_direction = Input.get_axis("up", "down")
	
	#move horizontal
	if h_direction:
		idle = false
		position.x += h_direction * SPEED
		#walk right
		if not v_direction:
			if h_direction > 0 and dir != "right":
				_animation_player.stop()
				_animation_player.play("Walk_Right")
				dir = "right"
			#walk left
			elif h_direction < 0 and dir != "left": 
				_animation_player.stop()
				_animation_player.play("Walk_Left")
				dir = "left"
	
	#move vertical
	if v_direction:
		idle = false
		position.y += v_direction * SPEED
		#walk down
		if v_direction > 0 and dir != "down":
			_animation_player.stop()
			_animation_player.play("Walk_Down")
			dir = "down"
		#walk up
		elif v_direction < 0 and dir != "up": 
			_animation_player.stop()
			_animation_player.play("Walk_Up")
			dir = "up"
			
	if not v_direction and not h_direction:
		if not idle:
			idle = true
			_animation_player.stop()
			#idle animaitions
			if dir == "up": _animation_player.play("Idle_Up")
			elif dir == "down": _animation_player.play("Idle_Down")
			elif dir == "left": _animation_player.play("Idle_Left")
			elif dir == "right": _animation_player.play("Idle_Right")
			
		
