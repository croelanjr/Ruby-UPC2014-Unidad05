#dado un arreglo que contiene las ventas del dia, se solicita obtener la suma de las ventas
def obtenerSumaVentas(ventas)
	suma = 0
	tam = ventas.size
	for i in 0..(tam-1)
		suma = suma + ventas[i]
	end
	return suma
end

#dado un arreglo que contiene las ventas del dia, se solicita obtener el promedio de venta
def obtenerPromedioVentas(ventas)
	sumatoria = obtenerSumaVentas(ventas)
	cantidad = ventas.size
	return (sumatoria / cantidad.to_f).round(2)
end

#dado un arreglo que contiene las ventas del dia, se solicita obtener la venta mas alta
def obtenerVentaMasAlta(ventas)
	venta = ventas[0]
	indice = 0
	for i in 0...ventas.size
		if venta < ventas[i]
			venta = ventas[i]
			i = i + 1
			indice = i
		end
	end
	return venta
end

#dado un arreglo que contiene las ventas del dia, se solicita obtener la venta mas baja
def obtenerVentaMasBaja(ventas)
	venta = ventas[0]
	indice = 0
	for i in 0...ventas.size
		if venta > ventas[i]
			venta = ventas[i]
			i = i + 1
			indice = i
		end
	end
	return venta
end

#dado un arreglo que contiene las ventas del dia y una variable x, se solicita
#saber cuantas ventas superaron el monto de x. Por ejemplo se tienen 3 ventas de
#10, 12 y 14 y el valor de X es 13, se devolveria 1, pues solo 1 venta supero
#el valor de 13
def obtenerCuantasVentasSuperaronXSoles(ventas, x)
	contador = 0
	for i in 0...ventas.size
		if x < ventas[i]
			venta = ventas[i]
			contador = contador + 1
		end
	end
	return contador
end

#dado un arreglo de ventas y los compradores de dichas ventas, determinar cual
#fue el nombre del cliente que hizo la mayor compra individual
def obtenerClienteMayorCompra(ventas, clientes)
	venta = ventas[0]
	indice = 0
	for i in 0...ventas.size
		if venta < ventas[i]
			venta = ventas[i]
			indice = i
		end
	end
	return clientes[indice]
end

#dado un arreglo de ventas y los compradores de dichas ventas, determinar cual
#fue el nombre del cliente que hizo mas compras en total
def obtenerClienteMasCompras(ventas, clientes)
	venta = ventas[0]
	indice = 0
	for i in 0...ventas.size
		if 10 < ventas[i] or ventas[i] < 0
			venta = ventas[i]
			indice = i
		end
	end
	return clientes[indice]
end

#--- zona de test ----

def test_obtenerSumaVentas
	ventas = [12,15,17]
    print validate(44, obtenerSumaVentas(ventas))
end

def test_obtenerPromedioVentas
	ventas = [12,15,17]
    print validate(14.67, obtenerPromedioVentas(ventas))
end

def test_obtenerVentaMasAlta
	ventas = [12,15,17]
    print validate(17, obtenerVentaMasAlta(ventas))
end

def test_obtenerVentaMasBaja
	ventas = [12,15,17]
    print validate(12, obtenerVentaMasBaja(ventas))
end

def test_obtenerCuantasVentasSuperaronXSoles
	ventas = [12,15,17]
    print validate(0, obtenerCuantasVentasSuperaronXSoles(ventas, 20))
	print validate(3, obtenerCuantasVentasSuperaronXSoles(ventas, 10))
	print validate(2, obtenerCuantasVentasSuperaronXSoles(ventas, 14))
end

def test_obtenerClienteMayorCompra
	ventas = [12,18,17]
	clientes = ["Hugo","Paco","Luis"]
    print validate("Paco", obtenerClienteMayorCompra(ventas, clientes))
end

def test_obtenerClienteMasCompras
	ventas = [12,18,17,14]
	clientes = ["Hugo","Paco","Luis", "Hugo"]
	ventas2 = [12,18,17,14,10]
	clientes2 = ["Hugo","Luis","Luis", "Luis", "Paco"]
	ventas3 = [1,2,52,3,6,1,1,1,]
	clientes3 = ["Luis","Paco", "Luis", "Paco", "Luis", "Luis", "Luis","Luis"]
    print validate("Hugo", obtenerClienteMasCompras(ventas, clientes))
	print validate("Luis", obtenerClienteMasCompras(ventas2, clientes2))
	print validate("Luis", obtenerClienteMasCompras(ventas3, clientes3))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  puts test_obtenerSumaVentas
  puts test_obtenerPromedioVentas
  puts test_obtenerVentaMasAlta
  puts test_obtenerVentaMasBaja
  puts test_obtenerCuantasVentasSuperaronXSoles
  puts test_obtenerClienteMayorCompra
  puts test_obtenerClienteMasCompras
end

test