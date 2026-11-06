extends Area2D

var abierta = false


func abrir():
	abierta = true
	$Sprite2D.modulate = Color(0.5, 1, 0.6)
