#encoding:UTF-8
=begin 
Una empresa de maquinas tragamonedas desea poder determinar cual es el premio asignado a un cliente. 
Para ello se le solicita desarrollar los siguientes subprogramas:

a) Un subprograma que permita determinar cuantas veces apareció un digito en un número determinado. 
Se tiene como datos de entrada el número y el digito. Por ejemplo, si el numero es 1234 y el digito es 5, 
se obtendrá como resultado 0; si el numero es 12344 y el digito es 4, se obtendrá como resultado 2.

b) Un subprograma que permita determinar cual es el digito que apareció 2 o mas veces en un número. 
Se tiene como dato de entrada un número. Por ejemplo, si el numero es 1234 se obtendrá como resultado 0 
pues ningún numero aparece mas de 2 veces, si el numero es 77093 se obtendrá como resultado 7. 
(Considerar que no puede haber 2 o mas coincidencias de distintos números, es decir no se puede dar el caso 7766,
 en donde se repite 2 veces el 7 y 2 veces el 6)

c) Un subprograma que permita determinar el premio a pagar. El premio se calcula de la siguiente manera: 
premio = numeroCoincidencias*10. En donde el número de coincidencias es el máximo número de veces que se 
repite un digito en el numero.

Nota: Para la formación del numero se considera dígitos del 1 al 9, se excluye el 0, es decir no se puede 
dar el siguiente numero 1002, pues el 0 esta excluido.
=end
def obtenerNumeroCoincidencias(valor, cifra)
	valor_cadena = valor.to_s
	cifra_cadena = cifra.to_s
	coincidencia = 0
	for a in 0...valor_cadena.size
		if valor_cadena[a] == cifra_cadena
			coincidencia = coincidencia + 1
		end
	end
	return coincidencia
end

def obtenerNumeroMasRepite(valor)
	cadena = valor.to_s
	ultimo = [] 
	contador = 0
	for i in 0...cadena.size	
		ultimo << cadena[i]
	end

	numero = ultimo
	letra = numero.select { |e| numero.count(e) > 1 }.uniq
	numeros = letra.join("")
	return numeros.to_i
end

def obtenerPremio(valor)
	total_valor = obtenerNumeroMasRepite(valor)
	coincide = obtenerNumeroCoincidencias(valor, total_valor)
	return coincide * 10
end

#--- zona del programa principal ----

#--- zona de test ----

def test_obtenerNumeroCoincidencias
    print validate(3, obtenerNumeroCoincidencias(6661,6))
    print validate(0, obtenerNumeroCoincidencias(1234,5))   
    print validate(2, obtenerNumeroCoincidencias(7881,8))    
	print validate(1, obtenerNumeroCoincidencias(7861,8))    
end

def test_obtenerNumeroMasRepite
    print validate(2, obtenerNumeroMasRepite(122234)) 
    print validate(7, obtenerNumeroMasRepite(76713)) 
    print validate(0, obtenerNumeroMasRepite(123456)) 
	print validate(9, obtenerNumeroMasRepite(999999)) 
end

def test_obtenerPremio
    print validate(0, obtenerPremio(123456))
    print validate(30, obtenerPremio(122324))
    print validate(50, obtenerPremio(199999))
	print validate(60, obtenerPremio(111111))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_obtenerNumeroCoincidencias
  test_obtenerNumeroMasRepite
  test_obtenerPremio
  puts " "
end
test
