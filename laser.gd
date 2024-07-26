extends Line2D

var lifetime = 0
const TIME_PERIOD = 0.2 # 200ms

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lifetime += delta
	if lifetime > TIME_PERIOD:
		queue_free()

func setPointThroughReticle(reticleRotation, reticlePosition):
	print('setPoints')
	rotation = reticleRotation
	var pointPosition = reticlePosition * 20
	add_point(position)
	add_point(pointPosition)

	var shape = get_node("Area2D/CollisionShape2D")
	shape.get_shape().set_b(pointPosition)


func _on_area_2d_body_entered(body):
	print('Entered body')
	print(body)
	if (body.has_method("_on_laser_hit")):
		body._on_laser_hit()
	pass # Replace with function body.
