def promedio(notas)
  total = 0
  for i in 0...notas.size
    total = total + notas[i]
  end
  return total / notas.size
end

def primer_puesto(notas, nombres)
  nota_mayor = notas[0]
  indice = 0
  for i in 0...notas.size
    if nota_mayor < notas[i]
      nota_mayor = notas[i]
      indice = i
    end
  end
  return nombres[indice]
end

def desaprobados(notas)
  contador = 0
  for i in 0...notas.size
    if notas[i] < 11
      contador = contador + 1
    end
  end
  return contador
end

def lista_aprobados(notas, nombres)
  aprobados = []
  for i in 0...notas.size
    if notas[i] >= 11
      aprobados.push(nombres[i])
    end
  end
  return aprobados
end

notas = [10.0, 16.6, 17.8, 7.9]
nombres = ["Karla", "Jorge", "Guille", "Ana"]
notas2= [15, 9, 19]
nombres2 = ["Ale", "Goyo", "Luis"] 


#puts promedio(notas)
#puts promedio(notas2)
#puts primer_puesto(notas, nombres)
#puts primer_puesto(notas2, nombres2)
puts desaprobados(notas)
puts desaprobados(notas2)

puts lista_aprobados(notas, nombres)
puts "-*******************-"
puts lista_aprobados(notas2, nombres2)