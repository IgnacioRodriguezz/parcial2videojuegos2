extends Area2D

const VELOCIDAD = 300
const DANIO = 50
var escena_impacto = load("res://escenas/impacto.tscn")


func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * VELOCIDAD * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemigos"):
		body.recibir_dano(DANIO)

	# instanciar el impacto donde pego
	var nuevo_impacto = escena_impacto.instantiate()
	nuevo_impacto.position = global_position
	$"/root/Juego".add_child.call_deferred(nuevo_impacto)

	queue_free()
