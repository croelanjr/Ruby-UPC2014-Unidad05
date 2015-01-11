=begin
Una compañía de distribución esta realizando un estudio de la distribución de la mercadería que se 
encuentra dentro de los camiones y poder analizar cual es la capacidad de ocupación que se esta teniendo 
en cada embarque. Para realizar este estudio es necesario obtener una serie de cálculos, los cuales son solicitados a continuación:

a)	Se pide determinar el porcentaje de ocupación de un contenedor, teniéndose como dato los volúmenes de las 
cargas y el volumen total del contenedor. Nota: Asumir que todas las cargas tienen forma cuadrangular así como el contenedor.
b)	Si se cobra por metro cúbico de carga una cantidad determinada, determinar cuanto es el ingreso total por la 
mercadería que se encuentra en un contenedor. Se tiene como datos de entrada un arreglo con los volúmenes de las cargas 
y el precio por metro cúbico.
c)	Si ahora se decide que el precio que se cobra no dependa únicamente de la variable volumen, sino también del 
precio, calcular cual es el ingreso total que se tiene por las cargas en un contenedor. La formula para calcular 
el precio de una carga que se aplica es la siguiente:

Costo= 22*Volumen*0.4 + 8*Peso*0.6
=end
def porcentajeOcupacion(carga, volumenTotal)
	suma = 0.0
	for i in 0...carga.size
		suma = suma + carga[i]
	end
	return ( 100 * suma / volumenTotal ).round(2)
end

def utilidad(carga, precioMetroCubico)
	suma = 0.0
	for i in 0...carga.size
		suma = suma + carga[i] * precioMetroCubico
	end
	return suma.round(2)
end

def nuevaUtilidad(volumen, peso)
	suma = 0.0
	for i in 0...volumen.size
		suma = suma + volumen[i] * 22 * 0.4 + 8 * peso[i] * 0.6
	end
	return suma.round(2)
end

#--- zona de test ----

def test_porcentajeOcupacion
	carga1=[2,4,6,5,3]
	carga2=[1,0.5,1.5,4.5]
	carga3=[2,6,5,4,7,8]

	print validate(20.00, porcentajeOcupacion(carga1,100.00))
    print validate(7.50, porcentajeOcupacion(carga2,100.00))
    print validate(32.00, porcentajeOcupacion(carga3,100.00))    
end

def test_utilidad
	carga1=[2,4,6,5,3]
	carga2=[1,0.5,1.5,4.5]
	carga3=[2,6,5,4,7,8]
	print validate(200.00, utilidad(carga1, 10))
    print validate(150.00, utilidad(carga2, 20))
    print validate(960.00, utilidad(carga3, 30))    
end

def test_nuevaUtilidad
	volumen1=[2,4,6,5,3]
	volumen2=[1,0.5,1.5,4.5]
	volumen3=[2,6,5,4,7,8]
	peso1=[15,23.4,14.5,8.3,6.8]
	peso2=[19,13.4,7.5,3.3]
	peso3=[20,60,15,24,17,18]
	
	print validate(502.40, nuevaUtilidad(volumen1,peso1))
    print validate(273.36, nuevaUtilidad(volumen2,peso2))
    print validate(1020.80, nuevaUtilidad(volumen3,peso3))   
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_porcentajeOcupacion
  puts " "
  test_utilidad
  puts " "
  test_nuevaUtilidad
end
test


