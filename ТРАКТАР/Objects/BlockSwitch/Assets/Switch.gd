extends Area2D

func _ready():
	calculate_position()
	var _error = Global.connect("blocks_switched", Callable(self, "calculate_position"))

func calculate_position():
	if Global.block_switch:
		$AnimatedSprite2D.animation = "red"
	else:
		$AnimatedSprite2D.animation = "blue"

func _on_Switch_body_entered(body):
	if body.has_method("is_player"):
		Global.switch_blocks()
		$AudioStreamPlayer.play(0)
