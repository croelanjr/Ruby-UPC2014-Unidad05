#supervision de grifos:
#el estado necesita determinar cual es el precio promedio de los combustibles que son vendidos en las distintas estaciones de servicio
#Con tal proposito ha determinado realizar un levantamiento de informacion respecto al precio del combustible Diesel y poder determinar
#un precio promedio asi como determinar cuales son las desviaciones existentes con respecto al precio fijado como referencial por parte 
#del gobierno.
#Para el efecto de este estudio inicial se ha levantado la informacion de las estaciones que pertenecen aun distrito.

#Se solicita

#determinar el precio promedio del diesel
#determinar cual es el monto de combustible mas alto registrado
#determinar cual es la desviacion del precio promedio con respecto al precio fijado como referencial (desviacion = referencial - preciopromedio)
#determinar el porcentaje de estaciones de servicio que tienen el precio similar al de referencia con una variacion de 0.20 centavos tanto arriba
#como debajo del precio sugerido

def precioPromedio(precios)
	total = 0.0
	for i in 0...precios.size
		total = total + precios[i]
	end
	return (total / precios.size).round(2)
end

def montoMasAlto(precios)
	mas_alto = precios.sort.reverse
	return mas_alto[0]
end

def desviacion(precios, precioReferencial)
	promedio = precioPromedio(precios)
	return (precioReferencial - promedio).round(2)
end

def porcentajeEstacionesConPrecioSimilar(precios, precioReferencial)
	promedio = precioPromedio(precios)
	desviaciones = desviacion(precios, precioReferencial)
	porcentaje = 0.0
	if desviaciones < -0.10
		porcentaje = 0
	elsif desviaciones == 0
		porcentaje = 100.00
	elsif desviaciones > 0.20
		porcentaje = (100.0 - ((promedio * 100.0) / precioReferencial)).round(2)
		#return (100.00 + ((promedio * 100.0) / precioReferencial)).round(2)
	end
	#puts porcentaje
	return porcentaje
end

#--- zona de test ----

def pregunta_1
    print validate(10.52, precioPromedio([10.45, 11.00, 10.12])) 
    print validate(12.00, precioPromedio([11.00, 12.00, 13.00])) 
end

def pregunta_2
    print validate(11.99, montoMasAlto([10.45, 11.99, 10.12]))
    print validate(13.00, montoMasAlto([11.00, 12.00, 13.00]))
	print validate(19.00, montoMasAlto([10.00, 12.00, 19.00]))
end

def pregunta_3
    print validate(0.43, desviacion([10.45, 11.00, 10.12], 10.95))
    print validate(-0.50, desviacion([11.00, 12.00, 13.00], 11.50))
end

def pregunta_4
    print validate(33.33, porcentajeEstacionesConPrecioSimilar([10.45, 11.00, 10.12], 10.95))
    print validate(0.00, porcentajeEstacionesConPrecioSimilar([11.00, 12.00, 13.00], 11.50))
	print validate(100.00, porcentajeEstacionesConPrecioSimilar([11.40, 11.50, 11.60], 11.50))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  pregunta_1
  pregunta_2
  pregunta_3
  pregunta_4
  puts " "
end
test