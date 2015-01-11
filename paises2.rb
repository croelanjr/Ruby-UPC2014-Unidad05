#encoding:UTF-8
=begin
La Unión Europea ha creado un conjunto de datos basados en su estadísticas anuales y quiere obtener 
información de cada uno de ellos. Por tal razón se le solicita a usted lo siguiente:
a)  Desarrollar un subprograma que permita determinar el pais con mayor población en un muestra dada.
b)  Desarrollar un subprograma que permita ordernar de manera asc (de menor a mayor) los paises basados en su población.
c)  Desarrollar un subprograma que permita determinar la población promedio en  una  muestra dada.
d)  Desarrollar un subprograma que permita saber cual es la desviación estándar de las muestras.

Funciones:
Desviación estándar:
=end
class Country
  include Comparable

  attr_accessor :name, :population

  def initialize(name, population)
    @name = name
    @population = population
  end

  def <=>(anOther)
    @population <=> anOther.population
  end
end

def paisConMasPoblacion(muestras)
      countries = muestras.map {|name, population| Country.new(name, population)}
      country = countries.max
      country.name
end

def ordenarPorPoblacion(muestras)
		countries = muestras.map {|name, population| Country.new(name, population)}
    countries.sort.map {|country| country.name}
end

def poblacionPromedio(muestras)
	    populations = muestras.map {|name, population| population}
      avg = populations.inject(0.0) {|accum, i| accum + i}.to_f / populations.size
      avg.round(2)
end

def desviacionEstandar(muestras)
	populations = muestras.map {|name, population| population}
  avg = poblacionPromedio(muestras)
  sum = populations.inject(0.0){|accum, i| accum + (i-avg)**2}
  Math.sqrt(sum/(populations.size - 1).to_f).round(2)
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
