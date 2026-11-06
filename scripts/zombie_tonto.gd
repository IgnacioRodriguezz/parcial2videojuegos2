extends Enemigo

@onready var jugador = $"/root/Juego/Jugador"

# guarda al jugador mientras lo tenga dentro del area, para seguir pegandole
var jugador_cerca = null


func _ready() -> void:
	ataque = 10
	vida = 100


func _physics_process(delta: float) -> void:
	mover()


func mover():
	var direccion = global_position.direction_to(jugador.global_position)
	velocity = direccion * velocidad
	look_at(jugador.global_position)
	move_and_slide()


func _on_area_ataque_body_entered(body: Node2D) -> void:
	jugador_cerca = body
	daniar()
	body.recibir_dano(ataque)


func _on_area_ataque_body_exited(body: Node2D) -> void:
	jugador_cerca = null


func _on_timer_ataque_timeout() -> void:
	if jugador_cerca != null:
		daniar()
		jugador_cerca.recibir_dano(ataque)
