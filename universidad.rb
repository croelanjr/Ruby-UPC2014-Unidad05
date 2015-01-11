#encoding:UTF-8
=begin
La “Universidad Villa” necesita potenciar su campaña de captación de alumnos para sus diferentes carreras. 
Para ello, ha visto conveniente realizar un estudio para determinar varios aspectos de los estudiantes 
actuales y así poder tomar algunas acciones al respecto. El estudio está basado en las notas que los 
alumnos han obtenido al final del ciclo por lo que es necesario que usted realice lo siguiente:
a)	Se necesita premiar al alumno que ha obtenido la nota más alta de toda la universidad. Para ello, debe 
desarrollar un subprograma que determine ¿Quién es este alumno?, debe indicar como resultado, el nombre y apellido, 
así como la carrera que sigue y el ciclo en el cual se encuentra. 
Por ejemplo: “Manuel Alberti, Ingeniería Industrial, ciclo VI”
b)	Se necesita saber ¿Cuántos alumnos están por sobre la media poblacional de notas obtenidas por los todos los 
alumnos de la universidad?, por ello debe desarrollar un subprograma que realice lo indicado.
Por ejemplo: si tenemos que las notas son [15.5, 16.4, 12.5, 14.0, 10.5] la cantidad resultante sería 3 porque esos 
son los alumnos con notas mayores a 13.78 que es la media poblacional. 
c)	Se necesita saber el porcentaje de alumnos que están en riesgo. Este riesgo se determina por todos los alumnos 
que están desaprobados en la universidad, tomando como base que para aprobar un curso, la nota mínima es 12.5.
=end
def determinarmejor(notas,nombres,carrera,ciclo)
	mayor_nota = notas[0]
	indice = 0
	for i in 0...notas.size
		if mayor_nota < notas[i]
			mayor_nota = notas[i]
			indice = i
		end
	end
	return nombres[indice] + ', ' + carrera[indice] + ', ' + ciclo[indice]
end

def determinarmayores(notas)
	total_nota = 0
	promedio = 0 
	cantidad = 0
	for i in 0...notas.size
		total_nota = total_nota + notas[i]	
	end
	promedio = (total_nota / notas.size).round(2)
	for i in 0...notas.size
		if notas[i] > promedio
			cantidad = cantidad + 1
		end
	end
	return cantidad	
end

def determinarriesgo(notas)
	menor_nota = 0
	for i in 0...notas.size
		if notas[i] < 12.5
			menor_nota = menor_nota + 1
		end
	end
	return (menor_nota * 100) / notas.size 
end

#--- zona de test ----

def test_determinarmejor
	notas1=[15.5,16.4,12.5,14.0,10.5]
	notas2=[10.5,11.4,13.5,14.0,9.5]
	notas3=[11.0,12.4,13.5,15.1,17.5]
	nombres1=["Jose Carpio","Manuel Alberti","Josefina Malca","Alberto Pinto","Karina Palacios"]
	carrera1=["Administración","Ingeniería Industrial","Marketing","Contabilidad","Negocios"]
	ciclo1=["ciclo V","ciclo VI","ciclo II","ciclo VIII","ciclo X"]
    print validate("Manuel Alberti, Ingeniería Industrial, ciclo VI", determinarmejor(notas1,nombres1,carrera1,ciclo1))
	print validate("Alberto Pinto, Contabilidad, ciclo VIII", determinarmejor(notas2,nombres1,carrera1,ciclo1))
	print validate("Karina Palacios, Negocios, ciclo X", determinarmejor(notas3,nombres1,carrera1,ciclo1))	
end

def test_determinarmayores
	notas1=[15.5,16.4,12.5,14.0,10.5]
	notas2=[10.5,11.4,13.5,14.0,9.5]
	notas3=[11.0,12.4,13.5,15.1,17.5]
	print validate(3, determinarmayores(notas1))
	print validate(2, determinarmayores(notas2))
	print validate(2, determinarmayores(notas3))
end

def test_determinarriesgo
	notas1=[15.5,16.4,12.5,14.0,10.5]
	notas2=[10.5,11.4,13.5,14.0,9.5]
	notas3=[11.0,12.4,13.5,15.1,17.5]
	print validate(20.00, determinarriesgo(notas1))
	print validate(60.00, determinarriesgo(notas2))
	print validate(40.00, determinarriesgo(notas3))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_determinarmejor
  test_determinarmayores
  test_determinarriesgo
  puts " "
end
test