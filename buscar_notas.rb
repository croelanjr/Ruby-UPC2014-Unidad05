# Una universidad requiere una aplicación para 
# las estadísticas de los alumnos y las búsquedas. 
# Para ello ya se tienen los datos de los alumnos y sus notas. 
#
# Se requiere un subprograma llamado buscar_mejor que 
# muestre al alumno con la mejor nota. 
#
# Un subprograma llamado buscar_peor que muestre al 
# alumno con la peor nota. 
#
# Un subprograma llamado cantidad_de_aprobados que muestre 
# la cantidad de alumnos que tienen una nota de 11 o más. 

def buscar_mejor(nombres,notas)
	nota_mayor = notas[0]
	indice = 0
	for i in 0...notas.size
		if nota_mayor < notas[i]
			nota_mayor = notas[i]
			indice = i
		end
	end
  return nombres[indice]
end

def buscar_peor_nota(notas)
	mala_nota = notas.sort.reverse
	return mala_nota.last
end

def cantidad_aprobados(notas)
	cantidad = 0
	for i in 0...notas.size
		if notas[i] > 8
			cantidad = cantidad + 1
		end	
	end
	return cantidad
end

#--- zona de test ----

def test_buscar_mejor
    nombres = ["Gian","Juan","Pedro","Javier","Jose"]
    notas   = [20,12,14,15,13]
    print validate("Gian",buscar_mejor(nombres,notas)) 
end

def test_buscar_peor_nota
    nombres = ["Gian","Juan","Pedro","Javier","Jose"]
    notas   = [20,12,14,15,13]
    print validate(12, buscar_peor_nota(notas))
end

def test_cantidad_aprobados
    nombres = ["Gian","Juan","Pedro","Javier","Jose"]
    notas   = [5,12,14,15,8]
    print validate(3, cantidad_aprobados(notas))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_buscar_mejor
  test_buscar_peor_nota
  test_cantidad_aprobados
  puts " "
end
test
