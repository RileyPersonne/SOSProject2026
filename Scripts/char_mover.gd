extends CharacterBody2D

@onready var _animation_player = self.get_node("AnimatedSprite2D")

const SPEED = 200
var dir = "down"
var idle = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#get input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * SPEED
	move_and_slide()
	
	#move horizontal
	if direction.x:
		
		#walk right
		if not direction.y:
			if direction.x > 0 and (dir != "right" or idle==true):
				_animation_player.stop()
				_animation_player.play("Walk_Right")
				dir = "right"
				idle = false
			#walk left
			elif direction.x < 0 and (dir != "left" or idle==true): 
				_animation_player.stop()
				_animation_player.play("Walk_Left")
				dir = "left"
				idle = false
	
	#move vertical
	if direction.y:
		#walk down
		if direction.y > 0 and (dir != "down" or idle==true):
			_animation_player.stop()
			_animation_player.play("Walk_Down")
			dir = "down"
			idle = false
		#walk up
		elif direction.y < 0 and (dir != "up" or idle==true): 
			_animation_player.stop()
			_animation_player.play("Walk_Up")
			dir = "up"
			idle = false
			
	if not direction.y and not direction.x:
		if not idle:
			idle = true
			_animation_player.stop()
			#idle animaitions
			if dir == "up": _animation_player.play("Idle_Up")
			elif dir == "down": _animation_player.play("Idle_Down")
			elif dir == "left": _animation_player.play("Idle_Left")
			elif dir == "right": _animation_player.play("Idle_Right")
			
		
