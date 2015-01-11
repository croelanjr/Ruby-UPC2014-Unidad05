# encoding:utf-8
=begin 
Una empresa desea una aplicación que le permita calcular la cantidad de almíbar que necesitan 
las latas de conservas de frutas para proceder con el enlatado respectivo. Para ello se sabe que 
la cantidad de almíbar por lata es la siguiente:
		
0.25gr por cada lata de conservas de piña.
0.35gr por cada lata de conservas de durazno. 
0.45gr por cada lata de conservas de surtidas.   

El total a calcular por cada tipo debe ser para toda la producción de los próximos meses teniendo 
en consideración que la cantidad de latas se incrementa en un 15% mensual po estudios estadísticos realizados.

Desarrollar el programa que permita a calcular la cantidad total de almíbar para los enlatados de los próximos meses
=end
def cantidadalmibar(tipo, latas, meses)
	if tipo == "piña"
		almibar = 0.25
	elsif tipo == "durazno"
		almibar = 0.35
	elsif tipo == "surtidas"
		almibar = 0.45
	end

	total = latas * almibar
	totale = []   # formar un arreglo

	i = 0
	for i in 1..meses
		incremento = total * 0.15
		total = total + incremento
		totale << total - incremento # hay que restar el incremento de cada mes 
		i = i + 1
	end

	cantidad_total = 0.0
	for j in 0...totale.size
		cantidad_total = cantidad_total + totale[j]
	end
	return cantidad_total.round(2)
end

#--- zona de test ----

def test_cantidadalmibar
    print validate(7659.52, cantidadalmibar('piña',3500,6))
    print validate(24021.93, cantidadalmibar('durazno',5000,8))    
    print validate(6291.65, cantidadalmibar('surtidas',2800,4))    
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_cantidadalmibar
  puts " "
end
test