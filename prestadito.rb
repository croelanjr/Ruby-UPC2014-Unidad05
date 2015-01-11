# La financiera PRESTADITO que otorga créditos a las MicroEmpresas 
# y evalúa a sus clientes sobre la base de lo siguiente:
#
# a) Debe ser un buen comerciante (B = Bueno, M = Malo).
# b) Su negocio debe estar situado en una zona comercial (C = Zona Comercial, N = Zona No Comercial).
# c) En la central de riesgo no debe tener deudas que exceden el 15% de sus ingresos mensuales del negocio.
#
# Los plazos son solicitados por el cliente 
# (plazos en meses, por ejemplo: 6, 12 o 18 meses).
#
# Asimismo, si el cliente califica al crédito, se solicita 
# calcular el monto de la cuota a pagar que consiste en dividir 
# el monto del préstamo total entre el número de cuotas. 
#
# La cuota ya contempla el interés a pagar que se aplica según 
# el monto del préstamo de acuerdo a la siguiente tabla:
#
# Monto del Préstamo en Soles   Tasa de Interes (interés simple)
# De 0 a  1500                  45 %
# De 1501 a  3000               40 %
# De 3001 a mas                 35 %
#
# Ejemplo:
# Si el cliente solicita s/. 1000 le corresponde la tasa de ínteres  
# de 45%. Si solicitó pagarlo a 12 meses la cuota seria: (1000 * 1.45) / 12 = 120.83
#
def cliente_califica?(tipo, zona, ingreso_mensual, deuda_mensual)
	tope = ingreso_mensual * 0.15
	if tipo == 'B' and zona == 'C'
		if deuda_mensual > tope
				return false
		else
				return true
		end
	else
		if deuda_mensual < tope
				return false
		end
	end
end

def cuota(monto, tiempo)
	case (monto)
	when 0..1500
		return ((monto * 1.45) / 12).round(2)
	when 1501..3000
		tt1 = monto * 1.40
		tt2 = tt1 + monto
		tt3 = tt2 / 24
		tt4 = tt1 / 12
		return (tt4 - tt3).round(2) 
	else
		tt1 = monto * 1.35
		tt2 = tt1 + monto
		tt3 = tt2 / 36
		tt4 = tt1 / 12
		tt5 = tt1 / 36
		return ((tt4 - tt3) - tt5).round(2)
	end
end

#--- zona de test ----

def test_cliente_califica?
    print validate(false,  cliente_califica?('B','C',4000,1000)) 
    print validate(true, cliente_califica?('B','C',4800,300))
    print validate(false, cliente_califica?('B','N',5000,200))
end

def test_cuota
    print validate(90.63, cuota(750,12))
    print validate(33.33, cuota(2000,24))
    print validate(48.61, cuota(5000,36))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_cliente_califica?
  test_cuota
  puts " "
end
test
