extends Node2D

@export var siguiente_nivel = ""

# banderas para que cada cosa se dispare una sola vez y no en cada frame
var puerta_abierta = false
var ya_termino = false


func _process(delta: float) -> void:
	$CanvasLayer/LabelPuntos.text = "puntos: " + str(Global.puntos)
	$CanvasLayer/LabelVida.text = "vida: " + str($Jugador.vida)

	if puerta_abierta:
		return

	if get_tree().get_first_node_in_group("enemigos") == null:
		puerta_abierta = true
		$Puerta.abrir()


func mostrar_cartel(texto, color):
	$CanvasLayer/Cartel/LabelCartel.text = texto
	$CanvasLayer/Cartel/LabelCartel.self_modulate = color
	$AnimationPlayer.play("cartel")


func game_over():
	if ya_termino:
		return
	ya_termino = true
	Global.anotar()
	mostrar_cartel("GAME OVER", Color(1, 0.2, 0.2))


func _on_puerta_body_entered(body: Node2D) -> void:
	if not $Puerta.abierta:
		return
	if ya_termino:
		return
	ya_termino = true
	$AnimationPlayer.play("final")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "final":
		if siguiente_nivel == "":
			Global.anotar()
			mostrar_cartel("VICTORY!", Color(0.4, 1, 0.5))
		else:
			get_tree().change_scene_to_file(siguiente_nivel)

	if anim_name == "cartel":
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
