extends Sprite2D
var rotation_speed = 1.0 # Скорость вращения спрайта

func _process(delta):
	rotate_sprite(delta) # Вызов функции вращения спрайта

func rotate_sprite(delta):
	rotation += rotation_speed * delta # Изменение угла поворота спрайт

