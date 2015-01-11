#encoding:UTF-8
=begin 
La Marina de Guerra del Perú desea un simulador de búsqueda de minas.
Para ello tiene un campo de 4 x 4 posiciones marcadas como 
 
 [0,0][0,1][0,2][0,3]
 [1,0][1,1][1,2][1,3]
 [2,0][2,1][2,2][2,3]
 [3,0][3,1][3,2][3,3]

En dicho campo se colocará una mina cuya posición se pedirá por 
consola usando la nomenclatura X, Y. Una vez ingresada la mina pedirá 
los puntos para buscar la mina puesta usando la nomenclatura X, Y. 
En caso de coincidir con la mina mostrará el mensaje "mina encontrada" 
en caso de no coincidir mostrará el mensaje "no hay mina".

Desarrollar un subprograma que permita colocar una mina en el arreglo
Desarrollar un subprograma que permita indicar cuantas minas hay
Desarrollar un subprograma que permita mover una mina de un punto a otro
Desarrollar un subprograma que permita ingresar una posición e indique
si hay una mina o no en ese lugar  
=end

def colocar_mina(campo, x, y)
  ubication = (campo[x][y] = 1)
  return ubication
end

def contar_minas(campo)
    ubicacion = campo.collect {|a,b,c,d| a + b + c + d}
    contador = 0
    for i in 0...ubicacion.size
        if ubicacion[i] == 1
          contador = contador + 1
        end
    end
  return contador
end

def mover_mina(campo, origen_x, origen_y, destino_x, destino_y)
	campo_origen = (campo[origen_x][origen_y] = 0)
  campo_destino = (campo[destino_x][destino_y] = 1)
end

def hay_mina?(campo, origen_x, origen_y)
	if campo[origen_x][origen_y] == 1
    return true
  else
    return false
  end
end

#--- zona de test ----


def test_colocar_mina
	x = 2
	y = 3
  colocar_mina(@campo, x, y)
  print validate(@campo[x][y], 1)
end

def test_contar_minas
  print validate(contar_minas(@campo), 1)
  @campo[1][0] = 1
  print validate(contar_minas(@campo), 2)
end

def test_mover_mina
  @campo[2][2] = 1
  @campo[3][3] = 0  
  mover_mina(@campo, 2, 2, 3, 3)
  print validate(@campo[2][2], 0)
  print validate(@campo[3][3], 1)
  
end

def test_hay_mina?
  print validate(hay_mina?(@campo,3,0), false)
  @campo[1][1] = 1
  print validate(hay_mina?(@campo,1,1), true)
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  @campo = [ [0,  0,  0,  0],
      [0,  0,  0,  0],
      [0,  0,  0,  0],
      [0,  0,  0,  0]
    ]
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_colocar_mina
  test_contar_minas
  test_mover_mina
  test_hay_mina?
  puts " "
end
test
