#encoding:UTF-8
=begin 
Se tiene la relacion de las calificaciones de un grupo de alumnos y debemos encontrar el promedio del salon,
cual es la notra mas baja del grupo y cuantas veces se ha repetido dicha dentro de la lista.
=end 

def promedio(arreglo)
	total = 0.0
	for i in 0...arreglo.size
		total = total + arreglo[i]
	end 

	return (total / arreglo.size).round(2)
end

def nota_mas_baja(arreglo)
	nota_baja = arreglo[0]
	for i in 0...arreglo.size
		if nota_baja > arreglo[i]
			nota_baja = arreglo[i]
		end
	end
	return nota_baja
end

def nota_repite(arreglo, nota)
	contador = 0
	for i in 0...arreglo.size
		if nota == arreglo[i]
			contador = contador + 1
		end
	end
	return contador
end

#------------Zona Test---------------
def test_promedio
	print validate(14.25, promedio(@arreglo1))
	print validate(13.60, promedio(@arreglo2))
end

def test_nota_mas_baja
	print validate(5, nota_mas_baja(@arreglo1))
	print validate(7, nota_mas_baja(@arreglo2))
end

def test_nota_repite
	nota = nota_mas_baja(@arreglo1)
	print validate(2, nota_repite(@arreglo1,nota))

	nota = nota_mas_baja(@arreglo2)
	print validate(4, nota_repite(@arreglo2, nota)) 
end

@arreglo1 = [12,18,16,12,13,15,16,17,18,19,20,5,8,7,5,9,17,20,18,20]
@arreglo2 = [7,11,12,13,14,7,16,17,18,19,20,7,9,8,7,9,20,20,18,20]

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_promedio
  test_nota_mas_baja
  test_nota_repite
  puts " "
end

test
