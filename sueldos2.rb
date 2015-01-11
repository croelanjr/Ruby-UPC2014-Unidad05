# encoding: UTF-8
=begin
Una empresa cuenta con la información de los sueldos de sus empleados 
los mismos que están asociados a sus nombres. La empresa tiene la urgencia de conocer lo siguiente:

- Un subprograma que reciba como parámetro el nombre de los empleados y otro con los sueldos de cada uno.
 Se debe determinar quién es el empleado que gana más en la empresa.
- Un subprograma que reciba como parámetro el nombre de los empleados y otro con los sueldos de cada uno. 
Se debe determinar quién es el empleado que gana menos en la empresa.
- Un subprograma que reciba como parámetro los sueldos de los trabajadores y nos retorne el promedio de 
todos los sueldos.
- Un subprograma que reciba como parámetro los sueldos de los trabajadores y nos retorne el total de los sueldos.
=end


def trabajador_de_mayor_sueldo(nombres, sueldos)
   indice = 0
   sueldo = sueldos[indice]
  for i in 0...sueldos.size
    if sueldos[i] > sueldo
	  indice = i
	  sueldo = sueldos[indice]
	end 
  end 
  return nombres[indice]
 end    

def trabajador_de_menor_sueldo(nombres, sueldos)
  indice = 0
  sueldo = sueldos[indice]
  for i in 0...sueldos.size
    if sueldos[i] < sueldo
	  indice = i
	  sueldo = sueldos[indice]
	end 
  end 
  return nombres[indice]
end

def promedio_sueldos(sueldos)
  return (total_sueldos(sueldos) / sueldos.size).round(2)
end

def total_sueldos(sueldos)
  totalSueldos = 0.00
  for i in 0...sueldos.size
    totalSueldos += sueldos[i]
  end 
  return totalSueldos.round(2)
end
    
#--- zona de test ----

def test_trabajador_de_mayor_sueldo
  print validate(trabajador_de_mayor_sueldo(@nombres1, @sueldos1 ), "Oscar Pimentel")
  print validate(trabajador_de_mayor_sueldo(@nombres1, @sueldos2 ), "Jose Alcantara")
  print validate(trabajador_de_mayor_sueldo(@nombres1, @sueldos3 ), "Ernesto Agurto")
end

def test_trabajador_de_menor_sueldo
  print validate(trabajador_de_menor_sueldo(@nombres1, @sueldos1), "Rocio Morante")
  print validate(trabajador_de_menor_sueldo(@nombres1, @sueldos2), "Maria Luyo")
  print validate(trabajador_de_menor_sueldo(@nombres1, @sueldos3), "Juan Perez")
end
def test_promedio_sueldos
  print validate(promedio_sueldos(@sueldos1), 2585.49)
  print validate(promedio_sueldos(@sueldos2), 58000.48)
  print validate(promedio_sueldos(@sueldos3), 216703.32)
end

def test_total_sueldos
   print validate(total_sueldos(@sueldos1), 31025.89)
   print validate(total_sueldos(@sueldos2), 696005.71)
   print validate(total_sueldos(@sueldos3), 2600439.82)
  
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  @nombres1 = ["Roberto Montero","Jose Alcantara","Rosario Medina","Rocio Morante","Maria Luyo","Oscar Pimentel","Alberto Pino","Celia Mayer","Alfredo Pinto","Juan Perez","Andres Montero","Ernesto Agurto"]
  @sueldos1 =[1250.12,1585.01,3456.54,234.19,1234.89,7861.99,1241.00,4001.01,4320.12,3400.88,1239.91,1200.23]
  @sueldos2 =[31232.21,211585.21,43456.24,12234.22,11234.19,127861.10,12241.02,40101.10,42320.10,11300.18,71239.92,81200.22]
  @sueldos3 =[81222.71,176585.44,43876.56,712514.55,81224.66,67861.70,77241.32,43101.30,342320.70,18130.56,75139.76,881220.56]

  puts "---------------------------"
  test_trabajador_de_mayor_sueldo
  test_trabajador_de_menor_sueldo
  test_promedio_sueldos
  test_total_sueldos
  puts " "
end
test