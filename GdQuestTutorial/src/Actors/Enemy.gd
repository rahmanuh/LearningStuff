extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -_speed.x
	
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	queue_free()
#	get_node("CollisionShape2D").disabled  = true
	
	
func _physics_process(delta: float) -> void:
	_velocity.y += _gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
