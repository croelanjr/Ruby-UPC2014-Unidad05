#encoding:UTF-8
=begin 
Se dispone de las calificaciones de los alumnos de una carrera de Industrial de EPE correspondiente a las 
asignaturas de Cultura del Perú, Fundamentos de Programación y Ética. Se solicita lo siguiente:

- Elaborar un subprograma que calcule el promedio de cada alumno y retorne el promedio general de la sección.
- Elaborar un subprograma que reciba como parámetro los promedios de los alumnos y calcule el promedio máximo.
- Elaborar un subprograma que reciba como parámetro los promedios de los alumnos y calcule el porcentaje de 
alumnos aprobados con promedio mayor o igual a 12.5
- Elaborar un subprograma que reciba como parámetros los promedios de los alumnos y sus apellidos y retorne quien es el peor alumno.
=end
def calculaPromedio(notas1, notas2, notas3)
    total = 0.0
    for i in 0...notas1.size
          total = total + notas1[i]
    end
    prom1 = total / notas1.size

    total = 0.0
    for i in 0...notas2.size
          total = total + notas2[i]
    end
    prom2 = total / notas2.size

    total = 0.0
    for i in 0...notas3.size
          total = total + notas3[i]
    end
    prom3 = total / notas3.size

    promedio = (prom1 + prom2 + prom3) / 3.0
    return promedio.round(2)
end
    
def promedioMayor(notas)
    total = notas[0]
    for i in 0...notas.size
      if total < notas[i]
          total = notas[i]
      end
    end
  return total.round(2)
end
    
def porcentajeAprobados(notas)
  cant = 0.0 
  for i in 0...notas.size
    if notas[i] >= 12.50
      cant = cant + 1
    end
  end
  porcentaje = (cant * 100.00 / notas.size)
  return porcentaje.round(2)
end
    
def peorAlumno(apellidos, notas)
  peorNota = notas[0]
  apellido = apellidos[0]
  for i in 0...notas.size
    if notas[i] < peorNota
      peorNota = notas[i]
      apellido = apellidos[i]
    end
  end
  return apellido
end

#----------------zona de test-----------------


  
  @notas1 = [12.00,10.00,12.00,9.00,13.00,10.00]
  @notas2 = [11.00,12.00,13.00,19.00,17.00,11.00]
  @notas3 = [18.00,11.00,14.00,8.00,15.00,12.00]

  @notas4 = [10.00,10.00,11.00,19.00,14.00,14.00]
  @notas5 = [12.00,12.00,12.00,9.00,13.00,13.00]
  @notas6 = [8.00,15.00,16.00,18.00,11.00,17.00]

  @promedios1 = [8.00,15.00,11.00,10.00,13.00,14.00]
  @promedios2 = [18.00,5.00,10.00,15.00,16.00,17.00]

  @apellidos1 = ["Perez","Cajas","Pinto","Mondragon","Neyra","Montero"]
  @apellidos2 = ["Pimentel","Angulo","Mejia","Medina","Reto","Flores"]

def test_buscoPromedioGeneral
        print validate(12.61, calculaPromedio(@notas1, @notas2, @notas3))
        print validate(13, calculaPromedio(@notas4, @notas5, @notas6))
end
    
def test_elPromedioMayorDelAula
        print validate(15.00, promedioMayor(@promedios1))
        print validate(18.00, promedioMayor(@promedios2))
end
    
def test_elPorcentajeAprobados
    print validate(50.00, porcentajeAprobados(@promedios1))
    print validate(66.67, porcentajeAprobados(@promedios2))
end 

def test_quieroSaberQuienEsElPeorAlumno
    print validate(peorAlumno(@apellidos2, @promedios2),"Angulo")
    print validate(peorAlumno(@apellidos1, @promedios1),"Perez")
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_buscoPromedioGeneral
  test_elPromedioMayorDelAula
  test_elPorcentajeAprobados
  test_quieroSaberQuienEsElPeorAlumno
  puts " "
end
test