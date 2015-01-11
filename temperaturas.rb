# Una empresa requiere conocer los cambios de temperatura de un lago que está siendo 
# inspeccionado por el Ministerio del Medio Ambiente para ver si se da la aprobación. 
# Para ello se debe analizar si es que de un mes a otro hay una subida de la temperatura de más 
# del 20% con lo cuál debería quedar descartada la posibilidad de dar el visto bueno
# Se pide para ello que desarrolle un subprograma que permita calcular la variación entre los 
# dos meses
# Se pide un subprograma que permita identificar si es que es se le da el visto bueno. En caso no
# existan varaciones mayores al 20% del mes anterior devolverá true, caso contrario false
# Se pide elabore un subprograma que calcule la temperatura promedio del lago. 


def variacion(temperaturas)
	temp_final = temperaturas.sort
	temp_inicial = temperaturas.sort.reverse
	temp_final_1 = temp_final[0]
	temp_inicial_1 = temp_inicial[0]
	variacion = temp_final_1 - temp_inicial_1
	for i in 0...temperaturas.size
		if temp_final_1 >= temperaturas[i]
			mayor = true
			indice = i
		else
			mayor = false
		end
	end
	return mayor
end

def promedio(temperaturas)
	total = 0
	for i in 0...temperaturas.size
    total = total + temperaturas[i]
  end
  return (total / temperaturas.size).round(2)
end



#----------------zona de test-----------------

    
@temperaturas = [11.14, 12.11, 13.0, 11.98, 10.90]      
@temperaturas2 = [10.0, 15.0]     

def test_variacion    
    print validate( true,variacion(@temperaturas))
	print validate( false,variacion(@temperaturas2))
end
    
def test_promedio
    print validate(11.83, promedio(@temperaturas))
	print validate(12.50, promedio(@temperaturas2))
	
end
    

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  puts test_variacion 
  puts test_promedio  
  puts " "
end
test