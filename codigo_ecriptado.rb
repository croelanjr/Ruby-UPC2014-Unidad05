#encoding:UTF-8
=begin 
En una empresa necesitan un algoritmo de encriptación rápido de números que les permita 
ocultar los mensajes que envían a sus clientes.

Por lo tanto uno de los programadores se le ocurrió la siguiente idea.

Primero se establece el valor de la llave, el cual será un valor que se le sume a cada 
dígito de nuestro set, en caso la suma de más de 10 entonces el valor restante debe empezar desde 0

Por ejemplo 90343993 y una clave de 5 da como resultado 45898448

Y luego se suma cada una de sus cifras y se obtiene el promedio de cual sólo se toma la parte 
entera y no la decimal y se agrega como número validador de nuestro número cifrado.

Desarrolle un subprograma que dada una clave y un número genere como resultado el número solicitado.

Desarrolle un subprograma que genere el código validador en base a un número y una clave.

Desarrolle un subprograma que genera la encriptación final.
=end
def encriptar(codigo,clave)
    cadena = codigo.to_s
    codigo = []
    numero = []
    for i in 0...cadena.size
      if cadena[i].to_i < 9
        numero.push(cadena[i].to_i + clave)
      else
        numero.push(cadena[i].to_i - clave)
      end  
    end

    for j in 0...numero.size
      if numero[j] <= 10
        codigo << numero[j]
      else 
        codigo << numero[j] - 10
      end
    end
    return codigo.join("").to_i
end

def codigo_validador(codigo)
  cadena = codigo.to_s
  total = 0
  for i in 0...cadena.size
    total = total + cadena[i].to_i
  end 
  return (total / cadena.size)
end

def encriptacion_final(codigo,clave)
    arreglo = []
    validacion = codigo_validador(codigo)
    seguridad = encriptar(codigo,clave)
    arreglo << seguridad << validacion
    return arreglo.join("").to_i
end

#--- zona del programa principal ----

#--- zona de test ----

def test_encriptar
    print validate(45898448, encriptar(90343993,5))
    print validate(5431, encriptar(8764,7))   
    print validate(33334546, encriptar(11112324,2))    
end

def test_codigo_validador
    print validate(5, codigo_validador(90343993)) 
    print validate(6, codigo_validador(8764)) 
    print validate(1, codigo_validador(11112324)) 
end

def test_encriptacion_final
    print validate(458984485, encriptacion_final(90343993,5)) 
    print validate(54316, encriptacion_final(8764,7)) 
    print validate(333345461, encriptacion_final(11112324,2))     
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_encriptar
  test_codigo_validador
  test_encriptacion_final
  puts " "
end
test
