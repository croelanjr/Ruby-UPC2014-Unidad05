=begin
Un estudiante de doctorado se encuentra realizando una investigación sobre los créditos que las instituciones financieras 
otorgan a las Pequeñas y Medianas empresas (PYMES). Para el desarrollo de su investigación ha recopilado datos en base 
a encuestas realizadas a las PYMES respondiendo dos preguntas:

a)	A la pregunta ¿en qué medida su empresa ha recibido préstamos de una entidad financiera? 
o	Las respuestas posibles eran: 
0=nada
1=poco 
2=mucho
b)	A la pregunta ¿En qué rango estuvo el total aproximado de sus créditos obtenidos en una entidad financiera? 
o	Las respuestas posibles eran:
1=Entre 0 y 10,000 nuevos soles
2=Entre 10,001 y 50,000 nuevos soles
3=Más de 50,000

Tener en cuenta que las respuestas se almacenan en un vector según los valores posibles. Se solicita lo siguiente:

-	Elaborar un subprograma ruby que indique cuantas empresas no recibieron préstamos de alguna entidad financiera.
-	Elaborar un subprograma ruby indique el número de empresas que recibieron créditos de entre 10,001 y 50,000 nuevos soles.
-	Elaborar un subprograma ruby que proporcione el porcentaje de empresas que recibieron mucho crédito de instituciones financieras.

=end

def calculaEmpresasSinCredito(respuesta)
	contador = 0
	for i in 0...respuesta.size
		if respuesta[i] == 0 
			contador = contador + 1
		end
	end
 	return contador
end
    
def calculaEmpresasConCredito(respuesta)
	contador = 0
	for i in 0...respuesta.size
		if respuesta[i] == 2
			contador = contador + 1
		end
	end
 	return contador
end
    
def porcentajeEmpresasConCredito(respuesta)
	cantidad = calculaEmpresasConCredito(respuesta)
	puts cantidad
end



#----------Zona de Test------------------


def probarEmpresasSinCredito
       print validate(1, calculaEmpresasSinCredito(@respuesta1))
       print validate(2, calculaEmpresasSinCredito(@respuesta2))
       print validate(2, calculaEmpresasSinCredito(@respuesta3))
end
    
def probarEmpresasConCredito
       print validate(2, calculaEmpresasConCredito(@respuesta21))
       print validate(2, calculaEmpresasConCredito(@respuesta22))
       print validate(3, calculaEmpresasConCredito(@respuesta23))
end

 def probarEmpresasMuchoCredito
       print validate(33.33, porcentajeEmpresasConCredito(@respuesta21))
       print validate(33.33, porcentajeEmpresasConCredito(@respuesta22))
       print validate(50.00, porcentajeEmpresasConCredito(@respuesta23))
 end   
    

#----------------zona de test-----------------

  @respuesta1 = [1,1,2,0,1,2]
  @respuesta2 = [0,0,1,2,1,2]
  @respuesta3 = [1,0,0,1,2,2]

  @respuesta21 = [1,1,2,3,1,2]
  @respuesta22 = [3,3,1,2,3,2]
  @respuesta23 = [2,3,3,1,2,2]

def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  probarEmpresasSinCredito
  probarEmpresasConCredito
  probarEmpresasMuchoCredito
  puts " "
end
test