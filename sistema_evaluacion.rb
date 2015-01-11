=begin
La universidad ABC está cambiando el sistema de calificación tradicional. Se propone que el alumno 
sea evaluado de manera constante. Para ello, al finalizar cada sesión de clase el profesor tomará 
una evaluación de los temas vistos en dicha sesión y de una duración máxima de quince minutos. 
Si el alumno falto a dicha sesión su nota para esa evaluación será de cero (0).
De acuerdo a ello se ha determinado que el alumno rendirá 13 pruebas que equivalen a las trece 
semanas de clase. Por ello, se le solicita lo siguiente:

a)	Desarrollar un subprograma que reciba las notas promedio final de los alumnos y determine el 
promedio de todo el salón
b)	Desarrollar un subprograma que teniendo como base las 13 notas de un alumno, nos retorne el 
promedio final obtenido. El promedio final se calculará tomando las 10 mejores notas obtenidas 
durante las 13 sesiones que tiene el curso.
c)	Desarrollar un subprograma que determine reciba las notas promedio final de todos los alumnos 
y determine quién fue el mejor alumno de la clase. 
=end
def calcularpromediosalon(promedios)
	total = 0.0
    for i in 0...promedios.size
     total = total + promedios[i]
    end
    return (total / promedios.size).round(2)
end


def calcularpromedioalumno(notas)
	total = 0.0
    for i in 0...notas.size
    	if notas[i] >= 11
     		total = total + notas[i]
     	end
    end
    return (total / 10.0).round(2)
end

def determinarmejoralumno(promedios,alumnos)
	mejor_nota = promedios[0]
	indice = 0
	for i in 0...promedios.size
		if mejor_nota < promedios[i]
			mejor_nota = promedios[i]
			indice = i
		end
	end
  return alumnos[indice]
end


#--- zona de test ----

def test_calcularpromediosalon
	promedios1=[11.00, 12.00, 16.00, 18.00, 5.00, 13.00, 15.00, 11.00, 7.00, 12.00, 17.00, 2.00, 11.00]
	promedios2=[15.00, 13.00, 12.00, 17.00, 15.00, 3.00, 16.00, 10.00, 8.00, 20.00, 16.00, 12.00, 15.00]	
	promedios3=[13.00, 10.00, 14.00, 15.00, 13.00, 11.00, 17.00, 9.00, 5.00, 15.00, 13.00, 18.00, 13.00]	
    print validate(11.54, calcularpromediosalon(promedios1)) 
    print validate(13.23, calcularpromediosalon(promedios2)) 
    print validate(12.77, calcularpromediosalon(promedios3)) 
end

def test_calcularpromedioalumno
	notas1=[11.00, 12.00, 16.00, 18.00, 5.00, 13.00, 15.00, 11.00, 7.00, 12.00, 17.00, 2.00, 11.00]
	notas2=[15.00, 13.00, 12.00, 17.00, 15.00, 3.00, 16.00, 10.00, 8.00, 20.00, 16.00, 12.00, 15.00]	
	notas3=[13.00, 10.00, 14.00, 15.00, 13.00, 11.00, 17.00, 9.00, 5.00, 15.00, 13.00, 18.00, 13.00]	
	print validate(13.60, calcularpromedioalumno(notas1)) 
	print validate(15.10, calcularpromedioalumno(notas2)) 
	print validate(14.20, calcularpromedioalumno(notas3)) 
end

def test_determinarmejoralumno
	promedios1=[11.00, 12.00, 16.00, 18.00, 5.00, 13.00, 15.00, 11.00, 7.00]
	promedios2=[15.00, 19.00, 12.00, 17.00, 15.00, 3.00, 16.00, 10.00, 8.00]	
	promedios3=[13.00, 10.00, 14.00, 15.00, 13.00, 11.00, 17.00, 9.00, 5.00]	
	alumnos=["Jose","Lorena", "Cecilia", "Diana","Alfredo","Myna","Pedro","Esteban","Karla"]		
    print validate("Diana",determinarmejoralumno(promedios1,alumnos)) 
    print validate("Lorena",determinarmejoralumno(promedios2,alumnos)) 
    print validate("Pedro",determinarmejoralumno(promedios3,alumnos)) 
end



def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_calcularpromediosalon
  puts " "
  test_calcularpromedioalumno
  puts " "
  test_determinarmejoralumno
  puts " "
end
test