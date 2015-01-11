#La reniec desea realizar un programa que le permita analizar ciertos datos de una poblacion.
#para esto ha recolectado una base de datos que le permitira realizar esta labor con su ayuda.

#Se tienen 4 arreglos que contienen los siguientes datos: nombre, edad, sexo, documentos

#Se pide determinar la cantidad de hombres cuya edad sea mayor a 40.
#Dado el numero de dni, obtener el nombre de dicho ciudadano.
#Dado un nombre, determinar cuantos homonimos tiene dicho ciudadano
#Determinar cuantos ciudadanos tienen la coincidencia de que su edad se encuentre en alguna parte de su numero de documento. 
#Por ejemplo si un ciudadano tiene su numero de documento 42264954 y tiene 26 años, entonces cumple con la condicion.

def hombresMayor40(listaEdades, listaSexos)
	contador = 0
	for i in 0...listaSexos.size
		if listaSexos[i] == 'M' and listaEdades[i] < 40
			contador = contador + 1
		end
	end
	return contador
end

def obtenerNombre(dni, listaDocumentos, listaNombres)
	indice = 0
	for i in 0...listaDocumentos.size
		if listaDocumentos[i] == dni
			indice = i
		end
	end
	return listaNombres[indice]
end

def obtenerNumHomonimos(nombre, listaNombres)
	contador = 0
	for i in 0...listaNombres.size
		if listaNombres[i] == nombre
			contador = contador + 1
		end
	end
	return contador 
end

def coincidenciaEdad(listaDocumentos, listaEdades)
	dni = listaDocumentos[0]
	edad = listaEdades[0] 
	contador = 0
	for i in 0...listaEdades.size
		if listaEdades[i] <= edad
			dni = listaDocumentos[i]
			contador = contador + 1
		end
	end
	return contador
end

#--- zona de test ----
def pregunta_1
	edades = [22,20,44,35,46,48]
	sexos = ['M','F','F','M','M','M']
    print validate(2, hombresMayor40(edades, sexos)) 
end

def pregunta_2
	documentos = ["42264954", "45553237", "44234532", "49000021", "43612323"]
	nombres = ["Jose Ruiz", "Maria Prado", "Luz Delgado", "Mario Ruiz", "Jose Ruiz"]
    print validate("Jose Ruiz", obtenerNombre("42264954", documentos, nombres))
	print validate("Maria Prado", obtenerNombre("45553237", documentos, nombres))
end

def pregunta_3
	nombres = ["Jose Ruiz", "Maria Prado", "Luz Delgado", "Mario Ruiz", "Jose Ruiz"]
    print validate(2, obtenerNumHomonimos("Jose Ruiz",nombres))
    print validate(1, obtenerNumHomonimos("Maria Prado",nombres))
	print validate(0, obtenerNumHomonimos("Maria Salgado",nombres))
end

def pregunta_4
	documentos = ["42264954", "45553237", "44234532", "49000021", "43612323"]
	edades = [22,20,44,35,46]
    print validate(2, coincidenciaEdad(documentos, edades))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  pregunta_1
  pregunta_2
  pregunta_3
  pregunta_4
  puts " "
end
test