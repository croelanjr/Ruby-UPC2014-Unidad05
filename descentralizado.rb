#encoding:UTF-8
=begin
Conocida es la afición de muchos peruanos por el torneo descentralizado. 
Por tal propósito usted decide realizar un programa en ruby que permita manejar información del torneo. 
Actualmente, usted cuenta con la información de los equipos que participan en esta edición del torneo, 
el puntaje de cada equipo así como la cantidad de goles a favor y en contra de los mismos. Esta información 
se encuentra en arreglos y no esta ordenada necesariamente por puntaje.

Se pide:
a)	Implementar un subprograma que devuelva el total de goles anotados en el torneo.
b)	Implementar un subprograma que devuelva el nombre del equipo más goleador.
c)	Implementar un subprograma que devuelva el nombre del equipo menos goleado.


=end
def totalGolesAnotados(goles)
  total = 0
  for i in 0...goles.size
    total = total + goles[i].to_i
  end
  return total 
end

def equipoMasGoleador(goles, equipos)
  mas_gol = goles[0]
  indice = 0
  for i in 0...goles.size
    if mas_gol < goles[i]
      mas_gol = goles[i]
      indice = i
    end 
  end
  return equipos[indice]
end

def equipoMenosGoleado(goles, equipos)
  menos_gol = goles[0]
  indice = 0
  for i in 0...goles.size
    if menos_gol > goles[i]
      menos_gol = goles[i]
      indice = i
    end 
  end
  return equipos[indice]
end

#--- zona de test ----

def test_totalGolesAnotados
     print validate(12, totalGolesAnotados([2, 4, 6]))
	 print validate(6, totalGolesAnotados([1, 2, 3]))
end

def test_equipoMasGoleador
	print validate("u", equipoMasGoleador([72, 60], ["u", "alianza"]))
	print validate("cristal", equipoMasGoleador([30, 10], ["cristal", "alianza"]))
end

def test_equipoMenosGoleado
    print validate("u", equipoMenosGoleado([22, 66], ["u", "alianza"]));
	print validate("boys", equipoMenosGoleado([20, 1, 120], ["cristal", "boys", "alianza"]));
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_totalGolesAnotados
  test_equipoMasGoleador
  test_equipoMenosGoleado
  puts " "
end
test