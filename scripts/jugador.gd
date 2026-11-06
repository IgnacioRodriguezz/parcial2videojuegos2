extends CharacterBody2D

const SPEED = 300.0
var escena_bala = load("res://escenas/bala.tscn")
var vida = 100


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED

	if Input.is_action_just_pressed("ui_accept"):
		# instanciar bala
		var nueva_bala = escena_bala.instantiate()
		$"/root/Juego".add_child(nueva_bala)
		nueva_bala.global_position = $Arma/ColorArma/Marker2D.global_position
		nueva_bala.global_rotation = $Arma/ColorArma/Marker2D.global_rotation

	move_and_slide()

	$Arma.look_at(get_global_mouse_position())


func recibir_dano(cantidad):
	if vida <= 0:
		return

	vida -= cantidad
	print("vida del jugador: " + str(vida))
	if vida <= 0:
		$"/root/Juego".game_over()
