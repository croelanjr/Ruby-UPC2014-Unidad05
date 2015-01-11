#Pregunta 1
=begin

Una empresa de seguridad desea una aplicación que le permita
determinar un código de seguridad para los usuarios. El sistema
realiza lo siguiente: basado el en código del usuario genera un
 valor promedio que adjunta a la ficha

Por ejemplo 90343993 será la suma de sus cifras y el promedio
 es decir 5. Si el valor resultante resulta ser un valor
  decimal se ignorará la parte decimal y se trabajará solamente
   con la parte entera

Desarrollar un subprograma que devuelva true si es que el valor 
del código tiene 8 cifras. En otro caso devolverá false

Desarrollar un subprograma que devuelva el valor del código
generado solamente si es que cumple con tener 8 dígitos, 
en otro caso devolverá 0. 

=end

def cantidad_correcta?(codigo)
  return (codigo.to_s.size == 8)
end

def codigo_seguridad(codigo)
  cadena = codigo.to_s
  total = 0
  for i in 0...cadena.size
    total = total + cadena[i].to_i
  end 
  return (total / cadena.size)
end


#--- zona del programa principal ----

#--- zona de test ----

def test_cantidad_correcta?
    print validate(true, cantidad_correcta?(98645342))
    print validate(false, cantidad_correcta?(8764))    
    print validate(true, cantidad_correcta?(11112324))    
end

def test_codigo_seguridad
    print validate(1, codigo_seguridad(11111111)) 
    print validate(5, codigo_seguridad(90343993)) 
    print validate(2, codigo_seguridad(12121268)) 
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_cantidad_correcta?
  test_codigo_seguridad
  puts " "
end
test