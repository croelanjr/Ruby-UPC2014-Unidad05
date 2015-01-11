#encoding:UTF-8
=begin
Un inventor quiere validar si es que la teoría que esta planteando esta en lo correcto. 
Para tal efecto ha realizado una serie de mediciones capturando una cantidad N de muestras 
discretas(números enteros). Para poder validar su teoría, necesita que se desarrolle una serie de 
funciones en Ruby para poder realizar los cálculos. Por tal razón se le solicita a usted lo siguiente:
a)	Desarrollar un subprograma que permita determinar el promedio de las muestras capturadas.
b)	Desarrollar un subprograma que permita saber cual es la desviación estándar de las muestras.
c)	Desarrollar un subprograma que permita determinar cuantas muestras están dentro de la desviación estándar
(es decir, cuyo valor esta dentro del rango [promedio-desviación, promedio + desviación]).

Funciones:
Desviación estándar:
=end
def promedioMuestras(muestras)
	total = 0.0
	promedio = 0.0
	for i in 0...muestras.size
		total = total + muestras[i]
	end
	promedio = total / muestras.size
	return promedio.round(2)
end

def desviacionEstandar(muestras)
	promedio = promedioMuestras(muestras)
	bessel = muestras.size - 1
	suma_total = 0.0
	for i in 0...muestras.size
		suma_total = suma_total + (muestras[i] - promedio.round(2)) ** 2
	end
	return (Math.sqrt(suma_total / bessel)).round(2)  # el comando de raiz cuadrada
end

def muestrasMayorDesviacion(muestras)
	desviacion = desviacionEstandar(muestras)
	promedio = promedioMuestras(muestras)
	minimo = promedio - desviacion
	maximo = promedio + desviacion
	contador = 0
	for i in 0...muestras.size
		if minimo < muestras[i] and muestras[i] < maximo
			contador = contador + 1
		end
	end
	return contador
end

#--- zona de test ----

def test_promedioMuestras
	muestra1 = [50,100,150,200,250,300]
	muestra2 = [1,2,3,4,5]
	muestra3 = [3,2,3,4,4]
    print validate(175.00, promedioMuestras(muestra1))
	print validate(3.00, promedioMuestras(muestra2))
	print validate(3.20, promedioMuestras(muestra3))
end

def test_desviacionEstandar
	muestra1 = [4,1,11,13,2,7]
	muestra2 = [1,2,3,4,5]
	muestra3 = [3,2,3,4,4]
	print validate(4.89, desviacionEstandar(muestra1))
	print validate(1.58, desviacionEstandar(muestra2))
	print validate(0.84, desviacionEstandar(muestra3))
end

def test_muestrasMayorDesviacion
	muestra1 = [4,1,11,13,2,7]
	muestra2 = [1,2,3,4,5]
	muestra3 = [1,2,3,8,20]
	print validate(4, muestrasMayorDesviacion(muestra1))
    print validate(3, muestrasMayorDesviacion(muestra2))
	print validate(4, muestrasMayorDesviacion(muestra3))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_promedioMuestras
  test_desviacionEstandar
  test_muestrasMayorDesviacion
  puts " "
end
test