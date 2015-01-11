#encoding:UTF-8
=begin
La Unión Europea ha creado un conjunto de datos basados en su estadísticas anuales y quiere obtener 
información de cada uno de ellos. Por tal razón se le solicita a usted lo siguiente:
a)	Desarrollar un subprograma que permita determinar el pais con mayor población en un muestra dada.
b)	Desarrollar un subprograma que permita ordernar de manera asc (de menor a mayor) los paises basados en su población.
c)	Desarrollar un subprograma que permita determinar la población promedio en  una  muestra dada.
d)	Desarrollar un subprograma que permita saber cual es la desviación estándar de las muestras.

Funciones:
Desviación estándar:
=end
def paisConMasPoblacion(muestras)
		 pais = muestras.collect {|x,y| x}
      muestra = muestras.collect {|x,y| y}
   	   poblaciones = 0
   	  		indice = 0
   	  		for i in 0...muestra.size
   	  			if poblaciones < muestra[i]
   	  				poblaciones = muestra[i]
   	  				indice = i	
   	  			end
   	  		end
   	return pais[indice]
end

def ordenarPorPoblacion(muestras)
 	tamaño = muestras.length
  	iteraciones = tamaño - 2
  	unless iteraciones > 0
  		return muestras 
  	end 
   	cambios = 2
  	while cambios > 1 do
    	cambios = 0
    		0.upto(iteraciones) do |i|
      			if muestras[i][1] > muestras[i + 1][1]
        			muestras[i], muestras[i + 1] = muestras[i + 1], muestras[i]
        			cambios = cambios + 1
      			end
    		end
    iteraciones = iteraciones - 1
  end
  return muestras.map { |muestra| muestra[0] }
end

def poblacionPromedio(muestras)
	total = 0.0
	cantidad = muestras.collect {|x,y| y}
	for i in 0...muestras.size
		total = total + cantidad[i]
	end
	return (total / muestras.size).round(2)
end

def desviacionEstandar(muestras)
	promedio = poblacionPromedio(muestras)
	bessel = muestras.size - 1
	cantidad = muestras.collect {|x,y| y}
	suma_total = 0.0
	for i in 0...muestras.size
		suma_total = suma_total + (cantidad[i] - promedio.round(2)) ** 2
	end
	return (Math.sqrt(suma_total / bessel)).round(2)  # el comando de raiz cuadrada
end

#--- zona de test ----

def test_paisConMasPoblacion
	muestra1 = [['Albania',28750],['Andorra',72766],['Austria',8023244],['Belarus',10415973],['Belgium',10170241],['Bosnia and Herzegovina',2656240]]
	muestra2 = [['Bulgaria',8612757],['Croatia',5004112],['Czech Republic',10321120],['Denmark',5249632],['Estonia',1459428],['Faroe Islands',43857]]
	muestra3 = [['Finland',5105230],['France',58317450],['Germany',83536115],['Gibraltar',28765],['Greece',10538594],['Hungary',10002541]]
    
    print validate('Belarus', paisConMasPoblacion(muestra1))
	print validate('Czech Republic', paisConMasPoblacion(muestra2))
	print validate('Germany', paisConMasPoblacion(muestra3))
end

def test_ordenarPorPoblacion
    muestra1 = [['Albania',28750],['Andorra',72766],['Austria',8023244],['Belarus',10415973],['Belgium',10170241],['Bosnia and Herzegovina',2656240]]
	muestra2 = [['Bulgaria',8612757],['Croatia',5004112],['Czech Republic',10321120],['Denmark',5249632],['Estonia',1459428],['Faroe Islands',43857]]
	muestra3 = [['Finland',5105230],['France',58317450],['Germany',83536115],['Gibraltar',28765],['Greece',10538594],['Hungary',10002541]]
	print validate(['Albania','Andorra','Austria','Bosnia and Herzegovina','Belgium','Belarus'], ordenarPorPoblacion(muestra1))
	print validate(['Faroe Islands','Estonia','Croatia','Denmark','Bulgaria','Czech Republic'], ordenarPorPoblacion(muestra2))
	print validate(['Gibraltar','Finland','Hungary','Greece','France','Germany'], ordenarPorPoblacion(muestra3))
end

def test_poblacionPromedio
    muestra1 = [['Albania',28750],['Andorra',72766],['Austria',8023244],['Belarus',10415973],['Belgium',10170241],['Bosnia and Herzegovina',2656240]]
	muestra2 = [['Bulgaria',8612757],['Croatia',5004112],['Czech Republic',10321120],['Denmark',5249632],['Estonia',1459428],['Faroe Islands',43857]]
	muestra3 = [['Finland',5105230],['France',58317450],['Germany',83536115],['Gibraltar',28765],['Greece',10538594],['Hungary',10002541]]
    print validate(5227869.0,   poblacionPromedio(muestra1))
    print validate(5115151.0,   poblacionPromedio(muestra2))
	print validate(27921449.17, poblacionPromedio(muestra3))
end

def test_desviacionEstandar
    muestra1 = [['Albania',28750],['Andorra',72766],['Austria',8023244],['Belarus',10415973],['Belgium',10170241],['Bosnia and Herzegovina',2656240]]
	muestra2 = [['Bulgaria',8612757],['Croatia',5004112],['Czech Republic',10321120],['Denmark',5249632],['Estonia',1459428],['Faroe Islands',43857]]
	muestra3 = [['Finland',5105230],['France',58317450],['Germany',83536115],['Gibraltar',28765],['Greece',10538594],['Hungary',10002541]]
	print validate(4886241.63, desviacionEstandar(muestra1))
    print validate(3961012.73, desviacionEstandar(muestra2))
	print validate(34463721.6, desviacionEstandar(muestra3))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_paisConMasPoblacion
  test_ordenarPorPoblacion
  test_poblacionPromedio
  test_desviacionEstandar

  puts " "
end
test
