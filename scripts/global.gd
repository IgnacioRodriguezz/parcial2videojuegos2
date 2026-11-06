extends Node

var nombre_archivo = "user://guardado.dat"
var puntos = 0
var tabla = []


func anotar():
	tabla.append(puntos)
	tabla.sort()
	tabla.reverse()
	if tabla.size() > 5:
		tabla.resize(5)
	grabar()


func grabar():
	var archivo = FileAccess.open(nombre_archivo, FileAccess.WRITE)
	archivo.store_var(tabla)
	archivo.close()


func cargar():
	if FileAccess.file_exists(nombre_archivo):
		var archivo = FileAccess.open(nombre_archivo, FileAccess.READ)
		tabla = archivo.get_var()
		archivo.close()
