extends CharacterBody2D
class_name Enemigo

@export var velocidad = 100
var vida
var ataque: int


func mover():
	pass


func daniar():
	print("restando energia del jugador " + str(ataque))


func recibir_dano(cantidad):
	vida -= cantidad
	print("vida del zombi: " + str(vida))
	if vida <= 0:
		Global.puntos += 500
		queue_free()
