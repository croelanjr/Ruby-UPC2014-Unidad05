#encoding:UTF-8
=begin
Una heladería esta teniendo muy buenas ventas durante las ultimas semanas y pretende hacer un análisis 
de las ventas que ha venido realizando. Para ello ha tomado una muestra de sus ventas de la última semana 
y se le pide a usted poder desarrollar lo siguiente:
a)	Desarrollar un subprograma que permita determinar cual ha sido el sabor de helado que mas se ha vendido. 
Para eso se tiene como datos de entrada los sabores y la cantidad de helados vendidos por sabor.
b)	Desarrollar un subprograma que me permita saber que sabor de helado da mayor rentabilidad. Para eso se tiene 
como datos de entrada los sabores, los precios de venta y los costos de cada sabor.
c)	La gerencia esta pensando disminuir los precios en un 5% para los sabores de piña, fresa y mango, pues ha 
escuchado rumores de que la competencia esta por abrir un local al costado de ellos. Determinar cual seria el 
nuevo sabor que da más rentabilidad. Para eso se tienen como datos de entrada los sabores, los precios de 
venta (sin el descuento) y los costos de cada sabor.
=end
def heladoMasVendido(sabores, ventas)
  mayor_venta = ventas[0]
  indice = 0
    for i in 0...ventas.size
      if mayor_venta < ventas[i]
        mayor_venta = ventas[i]
        indice = i
    end
  end
  return sabores[indice] 
end

def mayorRentabilidad(sabores, precios, costos)
  mayor_costo = 0
  mayor_renta = 0
  for i in 0...costos.size
    mayor_costo = precios[i] - costos[i]
    if mayor_renta < mayor_costo
      mayor_renta = mayor_costo
      indice = i
    end
  end
  return sabores[indice]
end

def variacion(sabores, precios, costos)
  varia = 0
  for i in 0...costos.size
    if sabores == "vainilla" && sabores == "fresa" && sabores == "mango"
      total = precios[i] - costos[i] + (precios[i] + 0.05)
    else
      total = precios[i] - costos[i]
    end
    if varia < total.size
      varia = total
      indice = i
    end
  end
  return sabores[indice] 
end


#--- zona de test ----

def test_heladoMasVendido
     print validate("fresa", heladoMasVendido(["vainilla","fresa","mango","coco","chocolate"], [100,120,60,40,50]))
	 print validate("coco", heladoMasVendido(["vainilla","fresa","mango","coco","chocolate"], [100,120,60,140,50]))
end

def test_mayorRentabilidad
	print validate("coco", mayorRentabilidad(["vainilla","fresa","mango","coco","chocolate"],[10,10,10,10,10],[8,7,8,6,8]))
	print validate("fresa", mayorRentabilidad(["vainilla","fresa","mango","coco","chocolate"],[10,10,10,10,10],[8,2,8,6,8]))
end

def test_variacion
    print validate("coco", variacion(["vainilla","fresa","mango","coco","chocolate"],[10,10,10,10,10],[8,7,8,6,8]))
	print validate("chocolate", variacion(["vainilla","fresa","mango","coco","chocolate"],[10,10,10,10,10],[8,8,8,9,8]))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_heladoMasVendido
  test_mayorRentabilidad
  test_variacion
  puts " "
end
test