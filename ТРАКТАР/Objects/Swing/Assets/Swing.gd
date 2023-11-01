@tool
extends Node2D

@export var length = 64
@export var duration = 2.0
@export var start = "left" # (String, "left", "right")

@onready var platform = $Platform
@onready var tween = $Tween

@onready var line1 = $Line2D
@onready var line2 = $Line2D2

var rot = 45

func _ready():
	if Engine.is_editor_hint():
		return
	
	if start == "left":
		rot = 45
	elif start == "right":
		rot = -45
	
	_on_Tween_tween_all_completed()

func _physics_process(_delta):
	if Engine.is_editor_hint():
		platform = $Platform
		tween = $Tween
		line1 = $Line2D
		#line2 = $Line2D2
		
		if start == "left":
			rot = 45
		elif start == "right":
			rot = -45
		
		platform.position = calculate_pos(rot)
		line1.points = PackedVector2Array([Vector2(0,0),platform.position])
		return
	
	platform.position = calculate_pos(rot)
	line1.points = PackedVector2Array([Vector2(0,0),platform.position])
#	line1.points = PoolVector2Array([Vector2(0,0),platform.position - Vector2(22,2)])
#	line2.points = PoolVector2Array([Vector2(0,0),platform.position + Vector2(22,-2)])

func calculate_pos(r):
	var norm = Vector2(0,1).rotated(deg_to_rad(r))
	return norm * length

func _on_Tween_tween_all_completed():
	tween.remove_all()
	tween.interpolate_property(self,"rot",null,-rot,duration,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	tween.start()
