#encoding:UTF-8
=begin
Una agencia de empleos especialistas en desarrollo de software tiene una base de datos, 
la cual le permite manejar información de los ingenieros, su pretensión salarial minima, y los skills en lenguaje de programación 
que tienen. Cada ingeniero solo maneja 1 lenguaje de programación y estos pueden ser los siguientes: “Java”, “Ruby” y “C” .
Con esta información se pide realizar lo siguiente:

Se pide:
a)	Implementar un subprograma que devuelva el porcentaje del total de ingenieros que manejan un lenguaje de programación dado.
b)	Determinar la cantidad de ingenieros que manejan el lenguaje de programación determinado y que tengan una expectativa salarial 
menor a un monto en soles ingresado.
c)	Devolver el nombre del ingeniero que mayor pretensión salarial tenga dado un lenguaje de programación dado.
=end
def totalIngenierosPorLenguaje(skills, lenguaje)
	contador = 0
	for i in 0...skills.size
		   	case skills[i] 
		   	when "C" 
		   		if lenguaje == "C"
		   		contador = contador + 1
				porcentaje = (contador * 100.00) / skills.size
				total_porcentaje = 100 - porcentaje
				end
			when "Ruby"
				if lenguaje == "Ruby"
		   		contador = contador + 1
				porcentaje = (contador * 100.00) / skills.size
				total_porcentaje = 100 - porcentaje
				end
			end
	end
	return porcentaje.round(2)
end

def expectativa(skills, salarios, lenguaje, expectativa)
	contador = 0
	for i in 0...skills.size
			case skills[i] 
		   	when lenguaje # "C" o "Ruby"
		   		if expectativa > salarios[i]
		   		contador = contador + 1
				end
			end
	end
	return contador
end

def mayorSalario(skills, salarios, nombres, lenguaje)
	mayor_salario = 0
	contador = 0
	for i in 0...skills.size
			case skills[i] 
		   	when lenguaje
		   		if salarios[i] > mayor_salario 
		   		contador = contador + 1
		   		mayor_salario = salarios[i]
				contador = i
				end
			end
	end
	return nombres[contador]
end

#--- zona de test ----

def test_totalIngenierosPorLenguaje
	 skills = ["Java","Ruby","Ruby","Java","Ruby","C","C"]
	 nombres = ["Hugo","Paco","Luis","Ronaldo","Leonel","Oscar","Manuel"]
	 salarios = [3000,2500,1500,2800,2000,3500, 3800]
     print validate(28.57, totalIngenierosPorLenguaje(skills, "C"))
	 print validate(42.86, totalIngenierosPorLenguaje(skills, "Ruby"))
end

def test_expectativa
	 skills = ["Java","Ruby","Ruby","Java","Ruby","C","C"]
	 nombres = ["Hugo","Paco","Luis","Ronaldo","Leonel","Oscar","Manuel"]
	 salarios = [3000,2500,1500,2800,2000,3500, 3800]
	print validate(1, expectativa(skills, salarios, "C", 3600))
	print validate(3, expectativa(skills, salarios, "Ruby", 2800))
end

def test_mayorSalario
    skills = ["Java","Ruby","Ruby","Java","Ruby","C","C"]
	nombres = ["Hugo","Paco","Luis","Ronaldo","Leonel","Oscar","Manuel"]
	salarios = [3000,2500,1500,2800,2000,3500, 3800]
	print validate("Manuel", mayorSalario(skills, salarios, nombres, "C"));
	print validate("Paco", mayorSalario(skills, salarios, nombres, "Ruby"));
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_totalIngenierosPorLenguaje
  test_expectativa
  test_mayorSalario
  puts " "
end
test