#encoding: UTF-8
=begin 
Con el actual incremento de la demanda de estacionamientos en la ciudad, las municipalidades exigen 
a los edificios que otorguen espacios para que los autos se estacionen. Para ello se les autoriza 
el cobro por estacionamiento. Por este motivo se le solicita que elabore un programa que permita 
llevar el control de este recurso.

Para ello se genera un vector que indica la cantidad de minutos que permaneció estacionado un 
vehículo en el edificio. Entonces se le solicita lo siguiente:

Realizar un subprograma que determine el importe a cobrar por concepto de parqueo. 
El subprograma recibe como parámetro de entrada la cantidad de minutos que permaneció estacionado 
el auto y el costo de parqueo por hora. Si un auto estuvo por ejemplo 61 minutos se le debe cobrar 2 horas

Elaborar un subprograma que determine el total de la recaudación por los N autos estacionados. 

Elaborar un subprograma que determine cuantos autos permanecieron estacionados por 60  minutos o más.

=end
def cobroParqueo(minutos, tarifaHora)
    horas = minutos / 60
    fraccion = minutos % 60
    if fraccion > 0
      horas = horas + 1
    end
    return horas * tarifaHora.round(2)
end
    
def totalReacudacion(minutos, tarifaHora)
  total = 0.0
  for i in 0...minutos.size
    total = total + cobroParqueo(minutos[i], tarifaHora)
  end
  return total
end
    
def numeroAutosMas60Minutos(minutos)
  contador = 0
  for i in 0...minutos.size
    if minutos[i] >= 60
      contador = contador + 1
    end
  end
  return contador
end

#--------------zona de test-------------------
def test_cobrarParqueoporAuto
    print validate(2.0, cobroParqueo(60, 2))
    print validate(5.0, cobroParqueo(61,2.5))
    print validate(12.0, cobroParqueo(200,3))
end

def test_calcularTotalReacudacion
    @minutos = [2,61]
    print validate(6.0, totalReacudacion(@minutos, 2))
    print validate(9.0, totalReacudacion(@minutos, 3))
end

def test_calcularMas60Minutos
  @minutos1 = [2,60]
  @minutos2 = [2,59]
  @minutos3 = [2,60,61]
  print validate(1, numeroAutosMas60Minutos(@minutos1))
  print validate(0, numeroAutosMas60Minutos(@minutos2))
  print validate(2, numeroAutosMas60Minutos(@minutos3))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_cobrarParqueoporAuto
  test_calcularTotalReacudacion
  test_calcularMas60Minutos
  puts " "
end
test