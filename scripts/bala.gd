extends Area2D

const VELOCIDAD = 300
const DANIO = 50


func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * VELOCIDAD * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemigos"):
		body.recibir_dano(DANIO)
	queue_free()
