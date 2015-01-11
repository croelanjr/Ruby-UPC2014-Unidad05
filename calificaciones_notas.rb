# Suponga que se tiene las calificaciones de un grupo de 20 alumnos. 
# Realizar un algoritmo para calcular la calificación media y 
# la calificación más baja de todo el grupo

def media(arreglo)
   total = 0.0
   for i in 0...arreglo.size
     total = total + arreglo[i]
   end
   return (total / arreglo.size).round(2)
end

def calificacion_baja(arreglo)
  menor = 0
	for i in 0...arreglo.size
		if arreglo[i] < 4
			menor = menor + 1
		end	
	end
	return menor
end

#--- zona de test ----

def test_media
    arreglo = [10,11,12,13,14,15,16,17,18,19,20,5,4,3,3,3,20,20,18,20]
    print validate(13.05, media(arreglo))
end

def test_calificacion_baja
    arreglo = [10,11,12,13,14,15,16,17,18,19,20,5,4,3,3,3,20,20,18,20]
    print validate(3, calificacion_baja(arreglo))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_media
  test_calificacion_baja
  puts " "
end
test
