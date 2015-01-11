#encoding:UTF-8
=begin 
Un profesor de la universidad necesita controlar la calificación final de los alumnos. 
La evaluación del curso se realiza mediante una prueba escrita a los alumnos durante las 14 
semanas de clases (una cada semana), si el alumno falta a una sesión, su nota en dicha sesión 
es cero. Además, durante la clase otorga puntaje adicional sobre dicha práctica si es que los 
alumnos responden correctamente las preguntas que el profesor realiza durante su clase. Para 
ello, se le pide lo siguiente:
a)	Desarrollar un subprograma que permita determinar la nueva nota del alumno en una semana, 
tomando como parámetro la nota de la prueba escrita y el puntaje adicional sobre dicha prueba 
en esa semana. Tener en cuenta que la nueva nota no puede ser mayor a 19, salvo que su nota de 
prueba escrita sea 20 en cuyo caso su nota es 20 (La nota no puede ser mayor a 20). 
Por ejemplo: Si un alumno tiene 19 de nota del escrito y 3 putos adicionales, su nota será 19. 
Si el alumno tiene una nota de 20 en el escrito y 1 punto adicional, su nota será 20. Si un alumno 
tiene 18.3 en examen escrito y 3 puntos adicionales, su nota será 19. Pero si un alumno tiene una 
nota del escrito de 19.3 y 2 puntos adicionales, su nota deberá ser la del escrito 19.3.
b)	Implementar un subprograma que permita determinar la nota final de un alumno, teniendo como 
parámetros de entrada las notas de las prácticas y los puntajes adicionales obtenidos en todas las semanas. 
La nota final es el promedio de las 12 notas mayores. 
=end
def determinarnota(escrito, adicional)
	if escrito == 20.00
		return 20.00
	else
		total_nota = escrito + adicional
		if total_nota > 19.00
			if escrito > 19.00
				return escrito
			else
				return 19.00
			end
		else
			return total_nota
		end
	end
end

def determinarpromedio(notas,puntos)
	nuevas_nota = []
	for i in 0...notas.size
		nuevas_nota[i] = determinarnota(notas[i],puntos[i])		
	end
	suma = 0.0
	finales = nuevas_nota.sort
	for i in 2...finales.size
		suma = suma + finales[i]
	end
	promedio = suma / 12.0
	return promedio.round(2)	
end


#--- zona de test ----

def test_determinarnota
    print validate(16.20, determinarnota(14.2,2.0))
	print validate(20.00, determinarnota(20.0,1.0))
	print validate(19.00, determinarnota(18.3,2.0))
	print validate(19.50, determinarnota(19.5,3.0))	 
end

def test_determinarpromedio

	notas1 = [14.2,15.1,20.00,15.2,10.0,0.0,11.25,16.5,18.3,15.9,19.5,15.2,13.2,14.3]
	puntos1=[2.0,2.0,1.0,3.0,1.0,3.0,2.0,1.0,2.0,2.0,1.0,3.0,2.0,1.0] 
	notas2 = [11.2,14.1,18.50,18.2,13.0,10.10,12.25,17.5,8.3,5.9,19.1,7.2,11.2,12.3]
	puntos2=[1.0,0.0,1.0,3.0,1.0,1.0,2.0,1.0,2.0,2.0,1.0,3.0,2.0,1.0] 
    print validate(17.28, determinarpromedio(notas1,puntos1))
	print validate(14.84, determinarpromedio(notas2,puntos2))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_determinarnota
  test_determinarpromedio
  puts " "
end
test