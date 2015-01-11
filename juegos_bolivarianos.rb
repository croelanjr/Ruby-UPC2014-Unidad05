=begin
A raíz de los recientes juegos Bolivarianos en nuestro país, se necesita implementar una aplicación 
de software que ayude a los organizadores a realizar algunas tareas importantes. Para ello se le ha 
solicitado lo siguiente:

a)	Desarrollar un subprograma que determine el país que obtuvo mayor cantidad de medallas de oro.
b)	Elaborar un subprograma que permita determinar al ganador de los juegos, para ello se sabe que 
gana el que tiene mayor cantidad de medallas (oro, plata y bronce) 
c)	Elaborar un subprograma que determine el porcentaje de países que obtuvieron un número de medallas 
menor que el total de medallas otorgadas en los juegos entre todos los países participantes (cantidad de países / total medallas)
=end
def medallasdeOro(pais,medallasOro)
    mayor_medalla = medallasOro[0]
    indice = 0
    for i in 0...medallasOro.size
        if mayor_medalla < medallasOro[i]
            mayor_medalla = medallasOro[i]
            indice = i
        end
    end
    return pais[indice]
end


def encuentraGanador(pais,medallasOro,medallasPlata,medallasBronce)
    @medallas = []
    for i in 0...medallasOro.size
      @medallas << medallasOro[i] + medallasPlata[i] + medallasBronce[i]
    end
    ganador = medallasdeOro(pais,@medallas)
    return ganador
end

def debajoMedia(medallasOro,medallasPlata,medallasBronce)
    @cantidad_medalla = []
    numero_medalla = 0
    porcentaje_cada_pais = []
    for i in 0...medallasOro.size
      @cantidad_medalla << medallasOro[i] + medallasPlata[i] + medallasBronce[i]
    end

    cantidad_med = @cantidad_medalla
    for j in 0...cantidad_med.size
      numero_medalla = numero_medalla + cantidad_med[j]
    end

    cada_pais = @cantidad_medalla
    for h in 0...cada_pais.size
      porcentaje_cada_pais << (100 - (cada_pais[h] * 100.00) / numero_medalla).round(2)
    end
    #print @cantidad_medalla
    ##print numero_medalla
    #print porcentaje_cada_pais
    puts (numero_medalla.to_i * cada_pais.size) / 180.0
end


#--- zona de test ----

def test_medallasdeOro
	pais=["Colombia","Peru","Chile","Ecuador","Venezuela","Guatemala","Panama"]
	oro1=[23,45,34,12,5,33,44]
	oro2=[13,25,44,22,55,3,4]
	oro3=[63,45,34,12,5,33,55]
    print validate("Peru", medallasdeOro(pais,oro1)) 
    print validate("Venezuela", medallasdeOro(pais,oro2)) 
    print validate("Colombia", medallasdeOro(pais,oro3)) 
end

def test_encuentraGanador
  pais=["Colombia","Peru","Chile","Ecuador","Venezuela","Guatemala","Panama"]
  oro1=[23,45,34,12,5,33,44]
  plata1=[13,25,44,22,55,3,4]
  broce1=[63,45,34,12,5,33,55]
  oro2=[33,34,3,22,25,31,41]
  plata2=[13,20,42,21,5,31,14]
  broce2=[14,42,36,44,45,22,77]
  oro3=[13,15,14,12,11,16,18]
  plata3=[43,55,64,72,55,88,48]
  broce3=[63,45,34,12,5,33,55]

  print validate("Peru", encuentraGanador(pais,oro1,plata1,broce1)) 
  print validate("Panama", encuentraGanador(pais,oro2,plata2,broce2)) 
  print validate("Guatemala", encuentraGanador(pais,oro3,plata3,broce3)) 
end

def test_debajoMedia
  oro1=[23,45,34,12,5,33,44]
  plata1=[13,25,44,22,55,3,4]
  broce1=[63,45,34,12,5,33,55]
  oro2=[33,34,3,22,25,31,41]
  plata2=[13,20,42,21,5,31,14]
  broce2=[14,42,36,44,45,22,77]
  oro3=[13,15,14,12,11,16,18]
  plata3=[43,55,64,72,55,88,48]
  broce3=[63,45,34,12,5,33,55]

  print validate(42.86, debajoMedia(oro1,plata1,broce1)) 
  print validate(57.14, debajoMedia(oro2,plata2,broce2)) 
  print validate(28.57, debajoMedia(oro3,plata3,broce3)) 
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
 
  
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_medallasdeOro
  puts " "
  test_encuentraGanador
  puts " "
  test_debajoMedia
  puts " "
end
test