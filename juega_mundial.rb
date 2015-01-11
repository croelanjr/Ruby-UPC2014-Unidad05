# encoding: utf-8
=begin
Los aficionados al fútbol quieren obtener algo más de información del mundial, para lo cual le han pedido a 
usted que procese la información correspondiente a los grupos del mundial.

Para ellos le han proporcionado las siguientes tablas:

EQUIPOS	 		PJ	G	E	P	GF	GC	PTS	
PAISES BAJOS	3	3	0	0	10	3	9	
CHILE			3	2	0	1	5	3	6	
ESPAÑA			3	1	0	2	4	7	3	
AUSTRALIA		3	0	0	3	3	9	0	


EQUIPOS			PJ	G	E	P	GF	GC	PTS	
BRASIL			3	3	0	0	7	2	9	
MÉXICO			3	2	1	0	4	1	7	
CROACIA			3	1	0	2	6	6	3	
CAMERÚN			3	0	0	3	1	9	0	

Dada la tabla, se le pide elaborar 4 subprogramas.

Elaborar un programa para encontrar al equipo ganador del grupo, para lo cual debe fijarse la columna PTS (Puntos)
en caso dos equipos estén empatados debemos recurrir a la columna GF (Goles a favor)

Elaborar un programa para encontrar al equipo perdedor del grupo, para lo cual debe fijarse la columna PTS(Puntos) 
en caso dos equipos estén empatados debemos recurrir a la columna GC (Goles en contra). 

Elaborar un programa para encontrar el equipo con la mayor diferencia entre GF y GC (la diferencia se ordena de de 
positivo a negativo... ejemplo Paises Bajos => 7, Chile => 2, España => -3, Australia => -6... el equipo con mejor 
diferencia es “Paises Bajos”)
=end
def encontrar_ganador(grupo)
	goles = grupo.collect {|a,b,c,d,e,f,g| g}
	paises = grupo.collect {|a,b,c,d,e,f,g| a}
	gol = 0
	pais = paises[0]
	for i in 0...goles.size
		if gol > goles[i]
			gol = goles[i]
			pais = paises[i]
		end
	end
	return pais
end

def encontrar_perdedor(grupo)
	goles = grupo.collect {|a,b,c,d,e,f,g| g}
	paises = grupo.collect {|a,b,c,d,e,f,g| a}
	gol = 0
	pais = paises[0]
	for i in 0...goles.size
		if gol < goles[i]
			gol = goles[i]
			pais = paises[i]
		end
	end
	return pais
end

def encontrar_diferencia(grupo)
	goles = grupo.collect {|a,b,c,d,e,f,g| e - f}
	paises = grupo.collect {|a,b,c,d,e,f,g| a}
	gol = 0
	pais = paises[0]
	for i in 0...goles.size
		if gol > goles[i]
			gol = goles[i]
			pais = paises[i]
		end
	end
	return pais
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
