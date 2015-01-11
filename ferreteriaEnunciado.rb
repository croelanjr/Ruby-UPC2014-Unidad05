#Una ferreteria se dedica a la venta de distintas herramientas y piezas para
#la construcción y al aumentar sus ventas no cuentan con información
#pertinente a las ventas, por lo que le han encargado a ustedes realizar la
#tarea de catalogar las ventas.
 
#Para ello la empresa cuenta con la siguiente tabla de información de las
#ventas por producto en los últimos dos años
 
#Código      Descripción         2011        2012 
#CFX51120    LLave Inglesa       3,250.21    2,501.20
#FED32132    Valvula             4,570.52    16,321.21 
#JET11100    Silicona en Barra   1,875.25    1,875.25 
#EQR12R12    Tubo PVC            9,597.52    15,532.25

#La gerencia desea saber lo siguiente:

#1. Cuales son los productos que más se vendieron en el 2011 y 2012
#2. Determinar que producto subio mas sus ventas en el 2012 
#3. Determinar la variación del precio entre el 2011 y el 2012


#
# Obtener productos mas vendidos en el año 2011 y 2012
#
#  @return Arreglo con el codigo 2011 y 2012 ejemplo {"EQR12R12","FED32132"}

def obtenerProductoMasVendidos(tablaVentas)
	@arreglo = []
	mayor_venta = tablaVentas.collect {|x,y,z,u| (z + u) }
 	codigo = tablaVentas.collect {|x,y,z,u| x}
	resultado = mayor_venta
 	resultado_codigo = codigo
 	sales = resultado[0]
 	name = resultado_codigo[0]
 	for i in 1...resultado.size
 		if sales < resultado[i]
 			sales = resultado[i]
 			@arreglo << resultado_codigo[i]
 		end 
 	end
 	return @arreglo.sort
end

# 
# Obtener los productos con subida de ventas
#
# @param tablaVentas
# @return
#


def obtenerProductoConSubidaVentas(tablaVentas)
	mayor_venta = tablaVentas.collect {|x,y,z,u| u }
 	codigo = tablaVentas.collect {|x,y,z,u| x}
 	ventas = mayor_venta[0]
 	codigos = codigo[0]
 	for i in 0...mayor_venta.size
 		if ventas < mayor_venta[i]  
 			ventas = mayor_venta[i]
 			codigos = codigo[i]
  		end
 	end
 	return codigos
end

def obtenerLaDiferenciaPrecios(tablaVentas)
	variacion = tablaVentas.collect {|x,y,z,u| (u - z).round(2) }
	return variacion
end



#----------------zona de test-----------------

    
    @tableVentas = [["CFX51120","LLave Inglesa",3250.21,2501.20],
                              ["FED32132","Valvula",4570.52,16321.21],
                              ["JET11100","Silicona en Barra",1875.25,1875.25],
                              ["EQR12R12","Tubo PVC",9597.52,15532.25]]        
    
def obtenerProductoMasVendidosTest
    esperado = ["EQR12R12","FED32132"]
    print validate(esperado, obtenerProductoMasVendidos(@tableVentas))
end
    
def obtenerProductoConSubidaVentasTest
    print validate("FED32132", obtenerProductoConSubidaVentas(@tableVentas))
end
    
def obtenerLaDiferenciaPreciosTest
    esperado = [-749.01,11750.69,0,5934.73]
    print validate(esperado,obtenerLaDiferenciaPrecios(@tableVentas))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  obtenerProductoMasVendidosTest
  obtenerProductoConSubidaVentasTest
  obtenerLaDiferenciaPreciosTest
  puts " "
end
test