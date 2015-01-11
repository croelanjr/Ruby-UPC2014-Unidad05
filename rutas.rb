=begin 
Una empresa de ómnibus desea manejar ciertos indicadores financieros acerca de la venta 
de sus boletos en los distintos servicios que viene ofreciendo. Para eso se le solicita lo siguiente:
a)	Desarrollar un programa que permita determinar cual fue el monto recaudado por concepto de venta 
de boletos en un servicio determinado. Se tiene como datos de entrada la distribución de pasajeros 
así como los montos que pagaron cada uno de ellos dependiendo del tipo de asiento de acuerdo a la siguiente tabla:
	Tipo de asiento            Precio
	Normal                      60
	Premium                     90
b)	La empresa esta evaluando abrir nuevos servicios a los destinos en los que actualmente opera. Para eso se necesita 
saber que destino es el mas rentable teniendo para esto los datos de los destinos actuales, los ingresos por destino 
así como los costos por destino.
c)	Se sabe que una segunda empresa de ómnibus desea abrir servicio en la ruta que mas éxito tiene actualmente la empresa. 
Debido a esa razón la empresa decide realizar un descuento del 5% en las tarifas. Bajo esta nueva estructura de ventas, 
determinar si es que la ruta elegida en la pregunta B sigue siendo la más rentable.
=end
def montoRecaudado(distribucion)
  total = 0.0
  for i in 0...distribucion.size
      if distribucion[i]=="Premium"
			total = total + 90         
      else
			total = total + 60
	  end
  end
  return total.round(2)
end

def masRentable(destinos, ingresos, egresos)
  masRentable = 0
  nombreMasRentable = ""
  for i in 0...destinos.size
	  ganancia = ingresos[i] - egresos[i]
      if ganancia > masRentable
          masRentable = ganancia
		  nombreMasRentable = destinos[i]
      end
  end	
  return nombreMasRentable
end

def sigueSiendoLaMasRentable(destinos, ingresos, egresos)
	masRentableInicial = masRentable(destinos, ingresos, egresos)
	masRentable = 0
	nombreMasRentable = ""
	for i in 0...destinos.size
		ganancia = ingresos[i] - egresos[i]
		if destinos[i] == masRentableInicial
			ganancia = ingresos[i] * 0.95 - egresos[i]
		end
		if ganancia > masRentable
			masRentable = ganancia
			nombreMasRentable = destinos[i]
		end
	end	
	return masRentableInicial == nombreMasRentable
end


#--- zona de test ----

def test_montoRecaudado
	respuestas1=["Premium","Premium","Premium","Normal","Normal","Normal","Normal","Normal","Normal"]
	respuestas2=["Premium","Premium","Premium","Normal","Normal","Normal","Normal","Normal","Premium"]
	respuestas3=["Normal","Normal","Normal","Normal","Normal","Normal","Normal","Normal","Normal"]
	
    print validate(630.00, montoRecaudado(respuestas1)) 
    print validate(660.00, montoRecaudado(respuestas2)) 
    print validate(540.00, montoRecaudado(respuestas3)) 
end

def test_masRentable
	destinos=["Chiclayo","Ica","Tumbes","Loreto","Cusco"]
	ingresos1=[800, 900, 600, 750, 1200]
	egresos1=[200,150,100,250,400]

	ingresos2=[800, 900, 600, 1200, 700]
	egresos2=[200,150,100,250,400]
	
	ingresos3=[800, 900, 1300, 750, 1200]
	egresos3=[200,150,100,250,400]
	
  print validate("Cusco", masRentable(destinos, ingresos1, egresos1)) 
  print validate("Loreto", masRentable(destinos, ingresos2, egresos2)) 
  print validate("Tumbes", masRentable(destinos, ingresos3, egresos3)) 
end

def test_sigueSiendoLaMasRentable
	destinos=["Chiclayo","Ica","Tumbes","Loreto","Cusco"]
	ingresos1=[800, 900, 600, 750, 1200]
	egresos1=[200,150,100,250,400]

	ingresos2=[800, 900, 600, 1200, 700]
	egresos2=[200,150,100,250,400]
	
	ingresos3=[800, 900, 1300, 750, 1200]
	egresos3=[200,150,100,250,400]
	
  print validate(false, sigueSiendoLaMasRentable(destinos, ingresos1, egresos1)) 
  print validate(true, sigueSiendoLaMasRentable(destinos, ingresos2, egresos2)) 
  print validate(true, sigueSiendoLaMasRentable(destinos, ingresos3, egresos3)) 
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_montoRecaudado
  puts " "
  test_masRentable
  puts " "
  test_sigueSiendoLaMasRentable
  puts " "
end
test