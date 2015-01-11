#encoding:UTF-8
=begin 
La empresa Rosas Rosita esta queriendo aprovechar al máximo esta fecha tan especial, motivo por 
el cual ha lanzado una promoción en su página de facebook realizando una encuesta que tiene las siguientes preguntas:

1) Que tipo ramo de flores le va a regalar a su pareja esta fecha tan especial:
- Rosas 
- Tulipanes
- Margaritas
- Orquideas


2) Por la compra de un arreglo floral, que producto le gustaría poder llevarse a mitad de precio?
Peluche
Vino
Chocolates


Luego de varios días de tener la encuesta disponible al público, finalmente se logro recopilar 
los resultados de las encuestas. Para poder hacer una correcta gestión de la demanda de productos 
para este 14 de febrero; a usted se le entrega los datos de los votos individuales de los clientes 
y se le solicita a usted lo siguiente:

1.  Obtener el numero de votos que obtuvo una flor determinada.

2.  Identificar cual va a ser el tipo de arreglo florar que mas se espera vender.

3.  Identificar que producto a mitad de precio seria el mas aceptado por parte de los clientes si es que se da la promoción del 50%.

4.  Definir cuanto representaría (en porcentaje) la venta total de Tulipanes del total de ventas de flores.

5.  Obtener la rentabilidad total que se tendría por la venta de flores, sabiendo que se tienen los siguientes 
márgenes de utilidad por tipo de flor:
* Rosas: 30 soles.
* Tulipanes: 40 soles.
* Margaritas: 20 soles.
* Orquideas: 35 soles.

NOTA: Asumir que no va a haber empate entre 2 items dentro de la encuesta.
=end
def obtenerNumeroVotosPorTipoFlor(votosTipoFlores, tipoFlor)
    contador = 0
    for i in 0...votosTipoFlores.size
      if votosTipoFlores[i] == tipoFlor
        contador = contador + 1
      end
    end
    return contador  
end

def arregloFlorarQueMasSeEsperaVender(votosTipoFlores)
    flores = votosTipoFlores.last
    for i in 0...votosTipoFlores.size
      if votosTipoFlores[i] == flores
        flores = votosTipoFlores[i]
      end
    end
    return flores
end

def productoMitadPrecioMasAceptado(votosProductoPromocion)
    cont1 = 0
    cont2 = 0
    cont3 = 0
    for i in 0...votosProductoPromocion.size
      if votosProductoPromocion[i] == "Peluche"
         cont1 = cont1 + 1
         productox = votosProductoPromocion[i]
      elsif votosProductoPromocion[i] == "Vino"
         cont2 = cont2 + 1
         productoxx = votosProductoPromocion[i]
      elsif votosProductoPromocion[i] == "Chocolates"
         cont3 = cont3 + 1
         productoxxx = votosProductoPromocion[i]
      end
    end
    if cont1 > 2 
       return productox
    elsif cont2 > 2
       return productoxx
    elsif cont3 > 2
       return productoxxx
    end
end

def porcentajeTulipanesTotalVenta(votosTipoFlores)
    flores = "Tulipanes"
    cantidad_flores = obtenerNumeroVotosPorTipoFlor(votosTipoFlores, flores)
    return ((cantidad_flores * 100.00) / votosTipoFlores.size).round(2)
end
  
def obtenerRentabilidadTotal(votosTipoFlores)
      monto = 0.0
      for i in 0...votosTipoFlores.size
        if votosTipoFlores[i] == "Rosas"
          precio = 30.00
        elsif votosTipoFlores[i] == "Tulipanes"
          precio = 40.00
        elsif votosTipoFlores[i] == "Margaritas"
          precio = 20.00
        elsif votosTipoFlores[i] == "Orquideas"
          precio = 35.00
        end
          monto = monto + precio
      end 
      return monto.round(2)
end
 

#---------- zona de test -------------


  @tipoFlor = ["Rosas", "Tulipanes", "Margaritas", "Orquideas", "Orquideas"]
  @tipoFlor2 = ["Rosas", "Tulipanes", "Margaritas", "Orquideas", "Tulipanes"]
  @regalo1 = ["Vino", "Chocolates", "Peluche", "Peluche", "Peluche"]
  @regalo2 = ["Vino", "Chocolates", "Vino", "Vino", "Peluche"]

def test_obtenerNumeroVotosPorTipoFlor
  print validate(1, obtenerNumeroVotosPorTipoFlor(@tipoFlor,"Rosas"))
  print validate(1, obtenerNumeroVotosPorTipoFlor(@tipoFlor,"Tulipanes"))
  print validate(2, obtenerNumeroVotosPorTipoFlor(@tipoFlor,"Orquideas"))
end

def test_arregloFlorarQueMasSeEsperaVender
  print validate("Orquideas", arregloFlorarQueMasSeEsperaVender(@tipoFlor));
  print validate("Tulipanes", arregloFlorarQueMasSeEsperaVender(@tipoFlor2));
end

def test_productoMitadPrecioMasAceptado
  print validate("Peluche", productoMitadPrecioMasAceptado(@regalo1))
  print validate("Vino", productoMitadPrecioMasAceptado(@regalo2))
end

def test_porcentajeTulipanesTotalVenta
  print validate(20.0, porcentajeTulipanesTotalVenta(@tipoFlor))
  print validate(40.0, porcentajeTulipanesTotalVenta(@tipoFlor2))
    
end

def test_obtenerRentabilidadTotal
  print validate(160, obtenerRentabilidadTotal(@tipoFlor))
  print validate(165, obtenerRentabilidadTotal(@tipoFlor2))
end
   


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_obtenerNumeroVotosPorTipoFlor
  test_arregloFlorarQueMasSeEsperaVender
  test_productoMitadPrecioMasAceptado
  test_porcentajeTulipanesTotalVenta
  test_obtenerRentabilidadTotal
  puts " "
end
test
