# encoding: utf-8

def encontrar_ganador(grupo)
  ganador = ""
  puntaje_ganador = 0
  for i in 0...grupo.length
    if grupo[i][7] > puntaje_ganador
      ganador = grupo[i][0]
      puntaje_ganador = grupo[i][7]
    end
  end
  return ganador
end

def encontrar_perdedor(grupo)
  perdedor = ""
  puntaje_perdedor = 10
  for i in 0...grupo.length
    if grupo[i][7] < puntaje_perdedor
      perdedor = grupo[i][0]
      puntaje_perdedor = grupo[i][7]
    end
  end
  return perdedor
end

def encontrar_diferencia(grupo)
  diferencia = ""
  diferencia_mayor = 0
  for i in 0...grupo.length
    if grupo[i][5] - grupo[i][6] > diferencia_mayor
      diferencia = grupo[i][0]
      diferencia_mayor = grupo[i][5] - grupo[i][6]
    end
  end
  return diferencia
end

def validate(expected, value)    
  expected == value ? "." : "F"
end

def test_mundial
  grupo_a = [["Paises Bajos",3,3,0,0,10,3,9],
             ["Chile",3,2,0,1,5,3,6],
             ["España",3,1,0,2,4,7,3],
             ["Australia",3,0,0,3,3,9,0]]

  grupo_b = [["Brasil",3,3,0,0,7,2,9],
             ["México",3,2,1,0,4,1,7],
             ["Croacia",3,1,0,2,6,6,3],
             ["Camerún",3,0,0,3,1,9,0]]

  print validate("Paises Bajos",encontrar_ganador(grupo_a))
  print validate("Brasil",encontrar_ganador(grupo_b))
  print validate("Australia",encontrar_perdedor(grupo_a))
  print validate("Camerún",encontrar_perdedor(grupo_b))
  print validate("Paises Bajos",encontrar_diferencia(grupo_a))
  print validate("Brasil",encontrar_diferencia(grupo_b))
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_mundial
  puts " "
end

test
