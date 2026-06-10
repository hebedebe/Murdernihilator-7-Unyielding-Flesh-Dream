extends TextureRect
class_name Ammo

@export var max_ammo: int = 5

@onready var bullet_container: Control = $Bullets

var target_rotation: float
var rotation_velocity: float

var ammo: int = 5 :
	set(value):
		ammo = value
		var bullets = bullet_container.get_children()
		for i in range(bullets.size()):
			(bullets[i] as TextureRect).visible = !(ammo <= i)

func _ready():
	reload()

func _process(delta: float) -> void:
	rotation_velocity = rotation_velocity * (1-(delta*4))
	target_rotation += rotation_velocity * delta
	rotation = lerp(rotation, target_rotation, 30 * delta)
	
func reload():
	rotation_velocity = 40*PI
	ammo = max_ammo

func has_ammo() -> bool:
	return ammo > 0

func fire():
	ammo -= 1
	rotation_velocity = 10*PI
