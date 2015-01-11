=begin
2.- Financiera

La financiera PRESTAMAS otorga créditos a las Microempresas evalúa a sus clientes sobre la base de lo siguiente:

Primero debe cumplir con algunas características:

-	Debe ser un buen comerciante (B = Bueno, M = Malo).
-	Su negocio debe estar situado en una zona comercial (C = Zona Comercial, N = Zona No Comercial).
-	En la central de riesgo no debe tener deudas que exceden el 15% de sus ingresos mensuales del negocio.

Se solicita por tanto un subprograma que determine si el cliente califica para el crédito, cumpliendo con las características indicadas.

Segundo, los plazos por el cliente se realizan en meses, por ejemplo: 6, 12 o 18 meses. Que equivaldrán al número de cuotas que deberá 
pagar el cliente.

Tercero, si el cliente califica al crédito según el punto primero, se solicita calcular el monto de la cuota a pagar que consiste en 
dividir el monto del préstamo total entre el número de cuotas. La cuota ya contempla el interés a pagar que se aplica según el monto 
del préstamo de acuerdo a la siguiente tabla:

Monto del Préstamo en Soles	Tasa de Interés (interés simple)
Mayor a 0 hasta 1500	45 %
Mayor a 1500 hasta 3000	40 %
Mayor a 3000	35 %

Interés simple  (monto préstamo * (1+tasa/100)) / número de cuotas


Ejemplo:
Si el cliente solicita S/. 1,000.00 le corresponde la tasa de interés de 45% según la tabla. Si solicitó pagarlo a 12 meses la 
cuota seria: (1000 * 1.45) / 12 = 120.83

Se necesita un subprograma que devuelva la tasa a aplicar de acuerdo a la tabla y otro subprograma que devuelva la cuota a pagar
=end

#encoding:utf-8
def calificacliente(tipo, ubicacion, ingresos, deudas)
  respuesta = true
  if tipo != 'B'
   respuesta = false
  end
  if ubicacion != 'C'
    respuesta = false
  end
  limite = ingresos * 0.15
  if (deudas > limite)
	respuesta = false
  end  
  return respuesta
end

def devuelveTasa(monto)
  case(monto)
	when 0..1500
	 return 45.00
	when 1501..3000
	 return 40.00
	else
	 return 35.00
	end    
end

def calculaCuota(tipo,ubicacion,ingresos,deudas,monto,meses)
	if calificacliente(tipo, ubicacion, ingresos, deudas) == false
		return 0.0
	else
		tasa = 1 + (devuelveTasa(monto) / 100)
		cuota = monto * tasa / meses	
		return cuota.round(2)
	end
end

#--- zona de test ----

def test_calificacliente
    print validate(true, calificacliente('B', 'C', 3000.0, 400.0)) 
	print validate(false, calificacliente('B', 'C', 3000.0, 1500.0)) 
	print validate(true, calificacliente('B', 'C', 6000.0, 900.0)) 
end

def test_devuelveTasa
	print validate(45.00, devuelveTasa(1000.0))
	print validate(35.00, devuelveTasa(4500.0))
	print validate(40.00, devuelveTasa(3000.0))	
end

def test_calculaCuota
	print validate(120.83, calculaCuota('B', 'C', 3000.0, 400.0, 1000.0, 12))
	print validate(0.0, calculaCuota('B', 'C', 3000.0, 1500.0, 1000.0, 12))
	print validate(187.5, calculaCuota('B', 'C', 6000.0, 900.0, 5000.0, 36))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_calificacliente
  puts " "
  test_devuelveTasa
  puts " "  
  test_calculaCuota  
  puts " "    
end
test