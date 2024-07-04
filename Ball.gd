extends RigidBody3D

var time_hit_pressed = 0
var tracking_power = false
var ball_multiplier = 5
var current_direction = Vector3.FORWARD
var strokes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if tracking_power == true:
		time_hit_pressed += delta
		
	if Input.is_action_pressed("ui_left"):
		print("left")
		current_direction = current_direction.rotated(Vector3.UP, deg_to_rad(1))
		print($Marker3D.rotation)
		$Marker3D.rotate_object_local(Vector3.UP, deg_to_rad(1))
		#rotated(Vector3.UP, 100)
	if Input.is_action_pressed("ui_right"):
		current_direction = current_direction.rotated(Vector3.UP, deg_to_rad(-1))
		$Marker3D.rotate_object_local(Vector3.UP, deg_to_rad(-1))
		print("right")
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and sleeping:
		#time_hit_pressed = OS.get_tic
		print("pressed")
		tracking_power = true
	if Input.is_action_just_released("ui_accept"):
		#time_hit_pressed = OS.get_tic
		print("released")
		#released = true
		tracking_power = false
		
		# Need to change Vector3.FORWARD to be the direction to hit in87uuuuuuuuuuuuuuuuuuuuuuuup0o-
		apply_central_impulse(current_direction * (time_hit_pressed * ball_multiplier))
		
		time_hit_pressed = 0
		strokes += 1
		GameManager.player1[0] = strokes
		
		#can_hit = false

	if Input.is_action_pressed("ui_up"):
		$Camera3D.fov = $Camera3D.fov + 1
	if Input.is_action_pressed("ui_down"):
		$Camera3D.fov = $Camera3D.fov - 1
