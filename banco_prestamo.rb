#encoding:UTF-8
=begin 
Un banco desea el desarrollo de un programa que permita calcular el total que un cliente pagara 
en un período de tiempo por un préstamo realizado. Según el tipo de cliente se tiene un interés 
mensual según la siguiente tabla.

Tipo de Cliente	Interés mensual
Cliente A			4%
Cliente B			9%
Cliente C			12%

Con esta tasa de interés se debe calcular el interés generado en el tiempo por el monto ingresado. 
El interés es compuesto por lo que mes a mes se generan nuevos montos para el recálculo del interés. 

El usuario indicará al sistema el monto del préstamo, el tipo de cliente que es y el tiempo que desea 
el préstamo y el sistema le dará el monto total a pagar al final del periodo. 

Por ejemplo si un cliente tipo B pide 100 soles para un plazo de tres meses el cálculo es el siguiente:

1er mes: (100 * 0.04) = 4 por lo que el nuevo monto es 104 (100+4)
2do mes: (104 * 0.04) = 4.16 por lo que el nuevo monto es 108.16 (104+4.16)
3er mes: (108.16 * 0.04) = 4.3264 por lo que el monto final a pagar es: 112.4864 (108.16+4.3264)

Desarrollar el programa que permita al usuario final obtener el total a pagar al final del periodo. 
=end
def calcularTotal(monto,tipoCliente,tiempo)
	total = monto.to_f
	if tipoCliente == "A"
		tasa_mensual = 0.04
	elsif tipoCliente == "B"
		tasa_mensual = 0.09
	else
		tasa_mensual = 0.12
	end
	
	i = 0
	for i in 0..tiempo
		if i < tiempo
		intereses = total * tasa_mensual
		total = total +  intereses
		i = i + 1
		end
	end	
	return total.round(2)
end


#--- zona de test ----

def test_calcularTotal
    print validate(112.49, calcularTotal(100,"A",3)) 
    print validate(1677.10, calcularTotal(1000,"B",6)) 
    print validate(8181.55, calcularTotal(2100,"C",12)) 
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_calcularTotal
  puts " "
end
test
  
