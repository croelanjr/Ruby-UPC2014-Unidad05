#encoding: UTF-8
=begin
Se necesita un programa  que permita calcular el sueldo de un profesor en una universidad en 
EEUU tanto en soles como en dólares, dado la cantidad de horas por semana, las semanas trabajadas y la categoría.

Se sabe que el pago por hora($) de dictado está establecido por la categoría del profesor y 
se cuenta con la siguiente información:
 categoria      Pago por hora US$
 Principal			125
 Asociado			110
 Auxiliar			95
 Contratado			80
 Jefe de Practica	52                                                        
 
El tipo de cambio a usar es: 1 dólar = 2.7 soles.

Desarrollar los siguientes subprogramas

obtenerTarifaPorHora que según la categoría me indique el pago por hora.

obtenerSueldoDolares que reciba la tarifa por hora, la cantidad de horas por semana y la cantidad de 
semanas y me retorne el sueldo en dólares.

obtenerSueldoSoles que reciba el sueldo en dolares y el tipo de cambio y me retorne el 	
=end

def obtener_tarifa_por_hora(categoria)
	if categoria == "Principal"
		return 125
	elsif categoria == "Asociado"
		return 110
	elsif categoria == "Auxiliar"
		return 95
	elsif categoria == "Contratado"
		return 80
    elsif categoria == "Jefe de Practica"
    	return 52
    end
end

def obtener_sueldo_dolares(tarifa_por_hora, horas_por_semana, numero_de_semanas)
	return (tarifa_por_hora * horas_por_semana) * numero_de_semanas
end

def obtener_sueldo_soles(sueldo_dolares, tipo_cambio)
	return sueldo_dolares * tipo_cambio
end
#--- zona de test ----


def test_obtener_tarifa_por_hora
	
  print validate(obtener_tarifa_por_hora("Principal"), 125)
  print validate(obtener_tarifa_por_hora("Asociado"), 110)
  print validate(obtener_tarifa_por_hora("Contratado"), 80)
end

def test_obtener_sueldo_dolares
  print validate(obtener_sueldo_dolares(125, 10, 4), 5000)
  print validate(obtener_sueldo_dolares(95, 10, 1), 950)
end

def test_obtener_sueldo_soles
  print validate(obtener_sueldo_soles(100, 2.7), 270)
  print validate(obtener_sueldo_soles(555, 2.7), 1498.5)
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_obtener_tarifa_por_hora
  test_obtener_sueldo_dolares
  test_obtener_sueldo_soles
  puts " "
end
test
