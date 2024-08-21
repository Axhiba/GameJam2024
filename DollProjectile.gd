class_name DollProjectile
extends RigidBody2D

signal stopped_moving

var activated = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !freeze:
		var currentVelocity = get_linear_velocity()
		var velocityIsZero = abs(currentVelocity.x) < 0.001 && abs(currentVelocity.y) < 0.001
		if velocityIsZero:
			freeze = true #Disable physics and collision, sticking the doll in place
			$CollisionShape2D.set_disabled(true)
			stopped_moving.emit()

func _on_laser_hit():
	activated = true

func attack():
	var attackRadiusArea = get_node("AttackRadius")
	var areas = attackRadiusArea.get_overlapping_areas()
	for area in areas:
		if area.has_method("takeAttack"): #Hurtbox.takeAttack
			area.takeAttack(3)
