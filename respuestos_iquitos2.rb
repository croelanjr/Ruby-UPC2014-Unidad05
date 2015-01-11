# encoding: UTF-8
=begin 
Existe un reporte en la empresa REPUESTOS IQUITOS S.A. con la siguiente información:

    VENTAS
Código    Descripción       2010    2011
RMF8IX1   Radiador        1250.21   2501.20
KRC90Z1   Bomba de petróleo   1250.52   1351.21
HYN9M90   Filtro de aceite    3125.25   4254.25
IIU90881P Cadena de distribución  6512.52   5524.25

Se le pide que implemente los siguientes subprogramas para determinar lo siguiente:

a)  ¿Cuál es el código del repuesto más vendido en el año 2011?
b)  ¿Qué repuesto (indicar descripción), es aquel que disminuyó sus ventas entre los años 2010 y 2011? 
(si son más de uno indicar el último de ellos).
c)  ¿Cuál es la variación de incremento o disminución (expresado en porcentaje) entre las ventas totales 
de repuestos entre los años 2010 y 2011?
=end

def mas_vendido(codigo, ventas2011)
  indice = 0
  venta = ventas2011[indice]
  for i in 0...ventas2011.size
    if ventas2011[i] > venta
	  indice = i
	  venta = ventas2011[indice]
	end 
  end 
  return codigo[indice]
end


def disminucion_ventas(descripcion, ventas2010, ventas2011)
  indice = 0
  for i in 0...ventas2010.size
    if ventas2011[i] < ventas2010[i]
	  indice = i
	end 
  end 
  return descripcion[indice]
end

def variacion_ventas(ventas2010, ventas2011)
  total2010 = 0.0
  total2011 = 0.0
  for i in 0...ventas2010.size
    total2010 += ventas2010[i]
	total2011 += ventas2011[i]
  end 
  variacion = (total2011 - total2010) / total2010 * 100
  return variacion.round(2)
end

#--- zona de test ----

def test_mas_vendido
  print validate(mas_vendido(@codigo1, @ventas2011a ), "EPO12Z11")
  print validate(mas_vendido(@codigo2, @ventas2011b ), "CTJ81X89")
end

def test_disminucion_ventas
  print validate(disminucion_ventas(@descripcion1, @ventas2010a, @ventas2011a), "Empaquetadura de motor")
  print validate(disminucion_ventas(@descripcion2, @ventas2010b, @ventas2011b), "Anillos")
end
def test_variacion_ventas
  print validate(variacion_ventas(@ventas2010a, @ventas2011a), 12.29)
  print validate(variacion_ventas(@ventas2010b, @ventas2011b), -48.56)
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
@codigo1 = ["PAX89Z18","VZL87X20","CKJ81X89","EPO12Z11"]
@descripcion1 = ["Pistón ","Válvula","Cigüeñal","Empaquetadura de motor"]
@ventas2010a = [1250.21,1250.52,3125.25,6512.52]
@ventas2011a = [2501.20,1351.21,4254.25,5524.25]

@codigo2 = ["ZAX89Z18","FZL87X20","CTJ81X89","EXO12Z11"]
@descripcion2 = ["Cadena distribucion ","Radiador","Bomba de combustible","Anillos"]
@ventas2010b = [11250.21,12250.52,43125.25,76512.52]
@ventas2011b = [12501.20,21351.21,34254.25,5524.25]

  puts "---------------------------"
  test_mas_vendido
  test_disminucion_ventas
  test_variacion_ventas
  puts " "
end
test