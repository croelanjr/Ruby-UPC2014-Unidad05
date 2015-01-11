=begin
El departamento de Transito del Lima pretende implementar el manejo de peajes de entrada 
utilizando una serie de stickers, los cuales van a variar en color dependiendo del numero 
de digito en que terminan las placas.

Se sabe que el color de sticker y digito final de la placa están relacionados de la siguiente manera:

    DÍGITO      COLOR
    1 o 2     amarillo
    3 o 4     rosa
    5 o 6     rojo
    7 o 8     verde
    9 o 0     azul  

Se ha hecho un levantamiento de información en base a una muestra tomada durante una semana en la 
panamericana sur, norte y carretera central. De esa muestra se obtuvo tanto el numero de placas de 
los vehículos así como el tipo de vehiculo.

Adicionalmente se sabe que existen los siguientes tipos de vehiculo: “Camion”, “Auto”, “Bus”

Con los datos obtenidos se solicita lo siguiente:

1. Cual es el porcentaje de stickers rojos que se espera ingresen a la ciudad de Lima.
2. Cual es el número de vehículos cuyas placas terminan con placas comprendidas entre los dígitos 3 y 8
3. Cual es el tipo de vehículos que mas ingresan a Lima.
4. Devolver un listado con las placas de todos aquellos vehículos que tengan sticker azul.
=end

def porcentajePlacasRojas(placas)
    cantidad_placa = placas
    contador = 0
    digito = []
    for i in 0...cantidad_placa.size
      cantidad = cantidad_placa[i]
      digito << cantidad[5].to_s
    end
    for j in 0...digito.size
      if digito[j] == "5" or digito[j] == "6"
      contador = contador + 1
     end 
    end
    return ((contador * 100.00 / cantidad_placa.size) / 100.00).round(2)
end
	
def numeroPlacas38(placas)
  cantidad_placa1 = placas
  contador1 = 0
  digito1 = []
  for i in 0...cantidad_placa1.size
    cantidad1 = cantidad_placa1[i]
    digito1 << cantidad1[5].to_s
  end
  for j in 0...digito1.size
    if digito1[j] == "3" or digito1[j] == "4" or digito1[j] == "5" or digito1[j] == "6" or digito1[j] == "7" or digito1[j] == "8"
      contador1 = contador1 + 1
    end
  end
  return contador1
   
end

def tipoVehiculoMasFrecuente(tipoVehiculo)
  tipo = tipoVehiculo[5]
  for i in 0...tipo.size
    if tipoVehiculo[i] = tipo
      selecionado = i
    end
  end
	return tipoVehiculo[selecionado]
end

def placasStickerAzul(placas)
  nueva_placa = []
  for i in 0...placas.size
    buscando = placas[i].to_s
    if buscando[5].to_s == "0" or buscando[5].to_s == "9"
      nueva_placa << placas[i]
    end 
  end
  return nueva_placa
end
    

#----------Zona de Test------------------

def test_porcentajePlacasRojas
     print validate(0.17, porcentajePlacasRojas(@placas1))
     print validate(0.00, porcentajePlacasRojas(@placas2))
     print validate(0.33, porcentajePlacasRojas(@placas3))
end
    
def test_numeroPlacas38
     print validate(6, numeroPlacas38(@placas1))
     print validate(5, numeroPlacas38(@placas2))
     print validate(4, numeroPlacas38(@placas3))
end

def test_tipoVehiculoMasFrecuente
     print validate("Auto", tipoVehiculoMasFrecuente(@modelo1))
     print validate("Bus", tipoVehiculoMasFrecuente(@modelo2))
     print validate("Camion", tipoVehiculoMasFrecuente(@modelo3))
end   
 
def test_placasStickerAzul
     print validate(@respuesta1, placasStickerAzul(@placas1))
     print validate(@respuesta2, placasStickerAzul(@placas2))
     print validate(@respuesta3, placasStickerAzul(@placas3))
end   
    
#----------------zona de test-----------------

  @placas1 = ["AGX123","BGX837","IUR923","YRS623","PSO998","MWR836"]  
  @placas2 = ["RYZ930","GUE844","CHI934","ROX123","WWW333","POR923"]  
  @placas3 = ["AGX125","BGX838","IUR929","YRS611","PSO977","MWR845"]  

  @modelo1 = ["Camion","Auto","Auto","Auto","Auto","Auto"] 
  @modelo2 = ["Bus","Camion","Bus","Bus","Bus","Bus"] 
  @modelo3 = ["Auto","Bus","Camion","Bus","Camion","Camion"] 
  
  @respuesta1 = []
  @respuesta2 = ["RYZ930"] 
  @respuesta3 = ["IUR929"] 

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_porcentajePlacasRojas
  test_numeroPlacas38
  test_tipoVehiculoMasFrecuente
  test_placasStickerAzul
  puts " "
end

test
