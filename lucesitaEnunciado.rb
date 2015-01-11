=begin
La empresa Lucesita S.A. brinda el servicio de energía eléctrica en los pueblos urbanos cercanos a la ciudad de 
Las Bambas. En los últimos años el consumo se ha visto incrementado por lo que la empresa necesita de una forma 
eficiente de controlar y cobrar el consumo de luz que realizan los usuarios.

Se conoce que el consumo mensual se realiza sobre la lectura del medidor instalado en cada casa donde se miden 
los Kilowatts (kw) consumidos y por una resta simple con la lectura del mes anterior se determina la cantidad 
de kw consumidos en el mes. De acuerdo a las normas establecidas el total a pagar en el mes se determina por 
tramos de la siguiente manera:

•	Los primeros 100 Kw, a s/. 0.5 el Kw
•	Los 150 Kw siguientes, s/. a 0.4 el Kw
•	Si el consumo excede de 250 Kw, esa parte se cobra a s/.0.3 el Kw.

Además se cobra una tarifa fija que equivale a S/.20.00 al mes.

Se solicita lo siguiente:

-	Un subprograma que reciba como parámetros los kw consumidos por una cantidad de usuarios y nos devuelva el total 
a cobrar por todos los usuarios a fin de mes.
-	Un subprograma que reciba como parámetro los kw consumidos y determine cuantos usuarios han consumido más de 250 
kw en el mes.
-	Un subprograma que reciba como parámetro los kw consumidos y los códigos numéricos de los usuarios y nos determine 
¿quién fue el usuario (código) que consumió más energía en el mes?
-	Un subprograma que reciba como parámetro los kw consumidos y determine cuál fue el menor consumo en nuevos soles 
que se produjo en el mes.

=end

def calcularTotalConsumo(lecturaKw)
	consumo = 0.0
	for i in 0...lecturaKw.size
		costo = 0
		if lecturaKw[i] < 100
			costo = lecturaKw[i] * 0.5 + 20.0
		elsif lecturaKw[i] < 250
			costo = 100 * 0.5 + (lecturaKw[i] - 100) * 0.4 + 20.0
		else
			costo = 100 * 0.5 + 150 * 0.4 + (lecturaKw[i] - 250) * 0.3 + 20.0
		end
		consumo = consumo + costo
	end
	return consumo.round(2)					
end
    
def cantidadUsuarios(lecturaKw)
	cont = 0
	for i in 0...lecturaKw.size
		if lecturaKw[i] > 250
			cont = cont + 1
		end
	end
	return cont 
end
    
def mayorConsumidorKw(codigo, lecturaKw)
	  	mayor = lecturaKw[0]
 		for i in 0...lecturaKw.size
			if mayor < lecturaKw[i]
			mayor = lecturaKw[i]
			indice = i	
			end	
		end
   return codigo[indice]
end
    
def menorConsumoEnSoles(lecturaKw)
  	menor = lecturaKw[0]
 		for i in 0...lecturaKw.size
			if menor > lecturaKw[i]
			menor = lecturaKw[i]	
			case lecturaKw[i]
 				when 1..100
 					precio = 0.5
 				when 101..250
 					precio = 0.4
 				when 251..999
 					precio = 0.3
 			end
			end	
		end
		return ((menor * precio) + 20.0).round(2)
end        

    
#----------Zona de Test------------------
def probarConsumoTotal
    print validate(697.80, calcularTotalConsumo(@lectura1))
    print validate(635.10, calcularTotalConsumo(@lectura2))
    print validate(780.60, calcularTotalConsumo(@lectura3))
end

def probarCantidadUsuarios
    print validate(2, cantidadUsuarios(@lectura1))
    print validate(1, cantidadUsuarios(@lectura2))
    print validate(2, cantidadUsuarios(@lectura3))
end

def probarMayorConsummidor
    print validate(66666, mayorConsumidorKw(@codigo1,@lectura1))
    print validate(300544, mayorConsumidorKw(@codigo2,@lectura2))
    print validate(111, mayorConsumidorKw(@codigo3,@lectura3))
end
 
def probarMenorConsumo
    print validate(55.00, menorConsumoEnSoles(@lectura1))
    print validate(30.00, menorConsumoEnSoles(@lectura2))
    print validate(42.5, menorConsumoEnSoles(@lectura3))
end
#----------------zona de test-----------------

@lectura1 =[90,110,85,120,251,300,70,145]
@lectura2 =[88,20,111,301,250,121,69,77]
@lectura3 =[305,45,100,150,250,350,109,96]
@codigo1 =[44444,55555,11111,22222,33333,66666,88888,99999]
@codigo2 =[100121,100232,200452,300544,400255,500111,600052,920011]
@codigo3 =[121,232,452,544,255,111,552,911] 

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  probarConsumoTotal
  probarCantidadUsuarios
  probarMayorConsummidor
  probarMenorConsumo
  puts " "
end
test