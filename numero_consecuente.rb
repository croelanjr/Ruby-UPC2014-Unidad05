#encoding:UTF-8
=begin 
Un arreglo de numeros es consecuente si todo numero que esta en posicion par es mayor que cada uno de los numeros que se encuentran 
en las posiciones impares. Desarrolle el programa que verifique si un arreglo de numeros es consecuente o no.

A => {10,150,20,125 40,160,110,138}

El arreglo A es consecuente porque todos los numeros en las posiciones pares (150,125,160,138), son mayores que los 
numeros (10,20,40,110) que encuentran en las casillas impares.
=end

def consecuencia(arreglo)
	es_impar = true
	for i in 0...arreglo.size
    if i % 2 == 0
		for j in 0...arreglo.size
			if !(j % 2 == 0)
				if arreglo[i] >= arreglo[j]
					es_impar = false
				end		
			end
		end
	end
	end 
	return es_impar
end

#---------zona de test------------------

def test_consecuente
	print validate(true, consecuencia([18, 150, 24, 125, 43, 160, 110,138]))
	print validate(false, consecuencia([88, 178, 121, 168, 76, 109]))
	print validate(false, consecuencia([1721, 1168, 594]))
	print validate(true, consecuencia([721, 839, 614, 748]))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_consecuente
  puts " "
end

test