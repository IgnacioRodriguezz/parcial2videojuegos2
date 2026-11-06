extends Enemigo

@onready var jugador = $"/root/Juego/Jugador"
var movement_target_position: Vector2

# guarda al jugador mientras lo tenga dentro del area, para seguir pegandole
var jugador_cerca = null

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


func _ready():
	ataque = 20
	vida = 150
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0

	actor_setup.call_deferred()
	movement_target_position = jugador.global_position


func actor_setup():
	await get_tree().physics_frame
	set_movement_target(movement_target_position)


func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target


func _physics_process(delta):

	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * velocidad
	look_at(next_path_position)
	move_and_slide()


func _on_timer_timeout() -> void:
	set_movement_target(jugador.global_position)


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
