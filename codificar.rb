# La agencia de inteligencia nacional desea desarrollar el 
# llamado código Aurelio para codificación de mensajes. 
# Para ello deberá reemplazar las letras de las palabras de la 
# siguiente manera 

# a = 1
# u = 2
# r = 3
# e = 4
# l = 5
# i = 6
# o = 7

# De tal manera la palabra perro, por ejemplo, cambiará a 
# p4337. La palabra gato será g1t7

# Desarrollar el programa que permita codificar las palabras. 

def codificar(palabra)
	arreglo = Array.new
	cadena = palabra.to_s
	for i in 0...cadena.size
		if cadena[i] == "a"
			arreglo.push(cadena[i]="1")
		elsif cadena[i] == "u"
			arreglo.push(cadena[i]="2")
		elsif cadena[i] == "r"
			arreglo.push(cadena[i]="3")
		elsif cadena[i] == "e"
			arreglo.push(cadena[i]="4")
		elsif cadena[i] == "l"
			arreglo.push(cadena[i]="5")
		elsif cadena[i] == "i"
			arreglo.push(cadena[i]="6")
		elsif cadena[i] == "o"
			arreglo.push(cadena[i]="7")
		else
			arreglo.push(cadena[i])
		end
	end
	return arreglo.join("")
end

#----------------zona de test-----------------

    


def test_codificar  
palabra = "perro"
palabra2 = "gato"
    print validate( "p4337",codificar(palabra))
	print validate( "g1t7",codificar(palabra2))
end       

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  puts test_codificar
  puts " "
end
test