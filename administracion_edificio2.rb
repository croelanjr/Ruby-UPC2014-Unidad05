=begin 
Un administrador de un edificio necesita realizar algunos cálculos recurrentes por lo que le pide a usted que lo ayude.

Los procedimientos son los siguientes:

El primero es llamado calculoConsumoMetrosCubicos que recibe un arreglo con la lectura an26441terior, 
un arreglo con la lectura actual,  y devuelve como resultado un arreglo con el consumo en m3. 
 
El segundo es llamado calculoMontoPagarDepartamentos que recibe un arreglo con los consumos (anteriores / actuales) 
realizados por los departamentos, el monto del recibo. 

Para hacer el cálculo se debe tomar en cuenta lo siguiente:

Monto recibo 230 Soles

Monto anterior   Monto actual       diferencia  porcentaje      Costo
50884                70775             19891        0.75            172.5
32443                38993             6550         0.25            57.5
                 total  26441

Donde el porcentaje se calcula en base al total de la diferencia.

=end
def calculoConsumoMetrosCubicos(lectura_anterior,lectura_actual)
  return lectura_actual.each_with_index.map { |lectura,i| lectura - lectura_anterior[i] }
end

def calculoMontoPagarDepartamentos(lectura_anterior, lectura_actual, monto_recibo)
  lecturas = calculoConsumoMetrosCubicos(lectura_anterior,lectura_actual)
  total = 0
  lecturas.each { |lectura| total += lectura }
  return lecturas.each_with_index.map { |lectura| ((lectura * 1.0 / total) * monto_recibo).round(2) }
end


def validate(expected, value)
  expected == value ? "." : "F"
end

def test_recibo

  lectura_anterior = [50884,32443,105565,79276,2249,758,44398,115940,4234,23980,67762,7585,33861,19931,6858,38630,3996]
  lectura_actual = [70775,38993,119656,94365,2417,883,52034,134658,4234,27375,83164,9747,40044,30513,8861,46750,5245]

  print validate([19891,6550,14091,15089,168,125,7636,18718,0,3395,15402,2162,6183,10582,2003,8120,1249],calculoConsumoMetrosCubicos(lectura_anterior,lectura_actual))
  print validate([34.83,11.47,24.67,26.42,0.29,0.22,13.37,32.77,0.0,5.94,26.97,3.79,10.83,18.53,3.51,14.22,2.19],calculoMontoPagarDepartamentos(lectura_anterior,lectura_actual,230))

end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_recibo
  puts " "
end

test
