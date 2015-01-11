# Un arreglo de números se llama partidario si todo número 
# que está en una casilla par (0, 2, 4,…) es mayor que cada 
# uno de los números que se encuentran en las casillas impares 
# (1, 3, 5,…). 
#
# Desarrolle el programa que verifique si un arreglo de números 
# enteros es partidario o no.
#
# Por ejemplo, en los siguientes arreglos:
#
# A => {100, 5, 200, 10, 150, 60, 130, 30}
#
# B => {50, 20, 40, 10, 45, 42, 60, 30}
#
# El arreglo A es partidario porque todos los números 
# (100, 200, 150, 130) que se encuentran en las casillas pares, 
# son mayores que los números (5, 10, 60, 30) que se encuentran 
# en las casillas impares.
#
# En cambio al arreglo B no es partidario porque el número 40 
# que se encuentra en una casilla par, es menor que el número 42 
# que se encuentra en una casilla impar.
#
# El programa debe devolver 1 si es partidario o 0 si no es partidario.

def partidario(arreglo)
	partida = true
	for i in 0...arreglo.size
    if i % 2 == 0
		for j in 0...arreglo.size
			if !(j % 2 == 0)
				if arreglo[i] <= arreglo[j]
					partida = false
				end		
			end
		end
	end
	end 
	return partida
end

#--- zona de test ----

def test_partidario
    print validate(true, partidario([100,5,200,10,150,60,130,30]))
    print validate(false, partidario([50,20,40,10,45,42,60,30]))
    print validate(true, partidario([230,50,100,60,210,5]))
    print validate(false, partidario([5,100]))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_partidario
  puts " "
end
test
