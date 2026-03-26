extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# Clear the viewport.
	var viewport = $ScreenViewport
	viewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	$ScreenViewportMesh.material_override.albedo_texture = viewport.get_texture()

func _input(event):
	if Global.is_computer_interacted:
		$ScreenViewport.push_input(event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_computer_screen_open_door():
	$Door.move_and_collide(Vector3(0,3,0))
	$ProgressSound.play()


func _on_area_3d_body_entered(body):
	if body == $Player:
		$Player.show_win_text()


func _on_player_exit_game():
	get_tree().quit()
