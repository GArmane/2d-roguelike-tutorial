extends State


func _on_proximity_body_entered(body: Node2D) -> void:
	owner.target = body
	emit_signal("finished", "Chase")

func enter(_previous_state_path: String) -> Result:
	owner.animation_player.play("fly")
	owner.move_direction = Vector2.ZERO
	owner.proximity_sensor.body_entered.connect(_on_proximity_body_entered)
	return Result.ok(self)

func exit() -> Result:
	owner.proximity_sensor.body_entered.disconnect(_on_proximity_body_entered)
	return Result.ok(self)
