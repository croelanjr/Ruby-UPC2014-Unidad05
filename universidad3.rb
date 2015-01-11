#encoding:UTF-8
=begin 
una universidad requiere poder identificar al mejor y al peor de los alumnos para poder
mostrar la informacion estadistica necesaria. Aspi mismo necesitamos saber cuantos alumnos
aprobados existen, teniendo en cuenta que la nota minima para aprobar es 13.
=end 

def buscar_mejor(nombres, notas)
	nota = notas[0]
	indice = 0
	for i in 0...notas.size
		if nota < notas[i]
			nota = notas[i]
			indice = i
		end
	end
	return nombres[indice]
end

def buscar_peor(nombres, notas)
	nota = notas[0]
	indice = 0
	for i in 0...notas.size
		if nota > notas[i]
			nota = notas[i]
			indice = i
		end
	end
	return nombres[indice]
end

def cantidad_aprobados(notas)
	contador = 0
	for i in 0...notas.size
		if notas[i] >= 13
			contador = contador + 1
		end
	end
	return contador
end

#------------Zona Test---------------
def test_promedio
	print validate("Gian", buscar_mejor(@nombres,@notas1))
	print validate("Pedro", buscar_mejor(@nombres,@notas2))
	print validate("Javier", buscar_mejor(@nombres,@notas3))
end

def test_nota_mas_baja
	print validate("Juan", buscar_peor(@nombres,@notas1))
	print validate("Gian", buscar_peor(@nombres,@notas2))
	print validate("Jose", buscar_peor(@nombres,@notas3))
end

def test_cantidad_aprobados
	print validate(4, cantidad_aprobados(@notas1))
	print validate(3, cantidad_aprobados(@notas2))
	print validate(5, cantidad_aprobados(@notas3))
end

@nombres = ["Gian", "Juan", "Pedro", "Javier", "Jose"]
@notas1 = [20,12,14,15,13]
@notas2 = [11,12,15,14,13]
@notas3 = [16,15,14,17,13]


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_promedio
  test_nota_mas_baja
  test_cantidad_aprobados
  puts " "
end

test
