=begin
El sistema de producción de café de su empresa 
está sufriendo de un problema de sobre costos 
debido a la incapacidad de calcular precios
a futuro puesto que los pedidos se 
tienen que hacer con mucho tiempo de 
anticipación.

Es por ello que se solicita calcular 
los posibles precios futuros. 
Para ello se ha investigado el flujo
de precios y se ha determinado lo siguiente:

El precio del café sube 10% cada mes 
pero en un periodo cada 3 meses 
solamente sube 5 % por lo tanto eso 
se debe tomar en cuenta para el cálculo. 

Así, si el precio inicial fuera 100, 
al final del mes 2 sería 121 y en el final del 
mes tres 127.05 y ya en el final del mes cuatro 
139.76 (tomando dos decimales). 

Su misión como gerente de compras es 
determinar el precio al que se comprará 
el café a futuro tomando en cuenta el 
precio actual y el periodo en tiempo al 
que se comprará el café. 

Por ejemplo si el precio actual es 100 y 
voy a comprar en 4 meses entoces el 
precio será 139.76.

Considerar que la evaluación siempre se hace 
en Enero. 

=end


def costo_cafe(costo, tiempo)
  for i in 1..tiempo
    if (i % 3) == 0 # cada 3 meses precio de cafe sube 5%
	  costo = costo + (costo * 0.05)
	else #de lo contrario sube 10%
	  costo = costo + (costo * 0.1)
	end
  end 
  return costo.round(2)
end

#--- zona del programa principal ----

#--- zona de test ----

def test_costo_cafe
    print validate(177.56, costo_cafe(100.0,7))
    print validate(1537.30, costo_cafe(1000.0,5))    
    print validate(363.0, costo_cafe(300.0,2))    
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_costo_cafe
  puts " "
end
test
  