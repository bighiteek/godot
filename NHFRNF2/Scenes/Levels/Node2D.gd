extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

# Скорость движения объекта
var speed = 200

func _process(delta):
	# Получаем позицию игрока (здесь предполагается, что игрок - это другой объект)
	var player_position = $Player.position
	
	# Рассчитываем новую позицию объекта, двигая его к позиции игрока
	var new_position = position.lerp(player_position, speed * delta)
	
	# Устанавливаем новую позицию для объекта
	position = new_position

