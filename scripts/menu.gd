extends Control


func _ready() -> void:
	Global.cargar()

	var texto = "mejores puntajes\n"
	var puesto = 1
	for p in Global.tabla:
		texto += str(puesto) + ".   " + str(p) + "\n"
		puesto += 1
	if Global.tabla.size() == 0:
		texto += "todavia no hay ninguno"

	$MarginContainer/VBoxContainer/LabelTabla.text = texto


func _on_boton_jugar_pressed() -> void:
	Global.puntos = 0
	get_tree().change_scene_to_file("res://escenas/juego.tscn")


func _on_boton_salir_pressed() -> void:
	get_tree().quit()
