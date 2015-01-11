#encoding:UTF-8
=begin 
El Banco de Credito ha iniciado una campaña para otorgar creditos a las empresas
PYME y está realizando una evaluacion a sus clientes en base en los siguiente:

a) Los clientes se catalogan como (A=Excelente, B=Bueno, C=Regular y M=Malo).
b) En cliente que solicita el credito no debe tener deudas que excedan el 10% de
sus ingresos mensuales si es nivel C, el 20% en caso sea nivel B y el 35% en caso
sea nivel A.

Los plazos son solicitados por el cliente (plazos en meses, por ejemplo: 6, 12, 18 o 24 meses).

Asimismo, si el cliente califica al credito, se debe calcular el monto de la cuota a pagar que consiste
en dividir el monto del prestamo total entre el numero de cuotas.

La cuota ya debe contemplar el interes a pagar por el cliente, que se aplica segun el monto del prestamo:

Monto del prestamo de Soles					Tasa de Interes
De 0 a 2500									45% para C, 35% para B y 25% para A
De 2501 a 4000								40% para C, 30% para B y 20% para A
De 4001 a mas  								35% para C, 25% para B y 15% para A

Ejemplo:
Si el cliente solicita S/. 1000 y está catalogado como cliente A entonces le corresponde la tasa de interes
de 25%. Si solicito pagarlo a 12 meses la cuota seria: (1000 * 1.25) / 12 = 104.17
=end 

def calificar_cliente(tipo, ingreso_mensual, deuda_mensual)
	tope = ingreso_mensual * 0.15
	if tipo == 'A'
		if deuda_mensual > tope
			return true
		end
	else
		if deuda_mensual > tope
			return false
		end
	end 
end

def cuota(monto, tiempo, tipo)
	 case monto
	 	when 0..2500
	 		if tipo == 'A'
	 			tasa = 0.25
	 		elsif tipo == 'B'
	 			tasa = 0.35
	 		elsif tipo == 'C'
	 			tasa = 0.45
	 		end
	 	when 2501..4000
	 		if tipo == 'A'
	 			tasa = 0.20
	 		elsif tipo == 'B'
	 			tasa = 0.30
	 		elsif tipo == 'C'
	 			tasa = 0.40
	 		end
	 	when 4001..9999
	 		if tipo == 'A'
	 			tasa = 0.15
	 		elsif tipo == 'B'
	 			tasa = 0.25
	 		elsif tipo == 'C'
	 			tasa = 0.35
	 		end
	 end
	 return ((monto * (1.00 + tasa)) / tiempo).round(2)
end

#--------Zona de Test-----------------

def test_calificar_cliente
	print validate(true, calificar_cliente('A', 4000,1000))
	print validate(false, calificar_cliente('B', 4000,1000))
	print validate(false, calificar_cliente('C', 4000,1000))
end

def test_cuota
	print validate(196.88, cuota(1750,12,'B'))
	print validate(120.83, cuota(2000,24,'C'))
	print validate(159.72, cuota(5000,36,'A'))
end

def validate (expected, value)
	expected == value ? "." : "F"
end

def test
	puts "Test de prueba del programa"
	puts "---------------------------"
	test_calificar_cliente
	test_cuota
	puts " "
end

test