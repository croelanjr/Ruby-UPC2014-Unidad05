 # Una farmacia hace preparados para sus clientes, los doctores ordenan una mezcla
 # de diferentes componentes basados en su peso, edad.
 # 
 # Para calcular el contenido de las capsulas la farmacia sigue el siguiente
 # procedimiento:
 # 
 # Si la persona pesa menos de 50 Kilos sólo agrega 200mg de Acido AcetilSalicilico
 # Si la persona pesa entre 50 y 70 Kilos agregan 350mg de Acido AcetilSalicilico
 # Si la persona pesa más de 70 Kilos agregan 400mg de Acido AcetilSalicilico
 # 
 # Dependiendo de la edad:
 #  Si la persona es niño (5 - 10) se agrega 50mg Antipiretico
 #  Si la persona es Joven (10 - 20) se agrega 70mg Antipiretico
 #  Si la persona es Adulta (20 a mas) se agregan 90mg Antipiretico
 # 
 # Como resultado se espera que el programa devuelva una cadena con la combinacion
 # correcta.
 # 
 # Ejemplo:
 #   "200mg Acido AcetilSalicilico y 50mg Antipiretico"
 #   "400mg Acido AcetilSalicilico y 70mg Antipiretico"
 #   "200mg Acido AcetilSalicilico y 90mg Antipiretico"
 # 

def obtenerFormulaKilos(peso)
	case peso
		when 1..50
			return "200mg Acido AcetilSalicilico"
		when 51..70
			return "350mg Acido AcetilSalicilico"
		when 70..999
			return "400mg Acido AcetilSalicilico"
	end
end
    
def obtenerFormulaEdad(edad)
	case edad
		when 5..10
			return "50mg Antipiretico"
		when 11..20
			return "70mg Antipiretico"
		when 21..99
			return "90mg Antipiretico"
	end
end
    
def generarFormula(peso, edad) 
 	pesos = obtenerFormulaKilos(peso)
 	edades = obtenerFormulaEdad(edad)
 	return pesos + ' y ' + edades
end




#----------------zona de test-----------------

def obtenerFormulaKilosTest
    print validate("200mg Acido AcetilSalicilico",obtenerFormulaKilos(30))
    print validate("350mg Acido AcetilSalicilico",obtenerFormulaKilos(60))
    print validate("400mg Acido AcetilSalicilico",obtenerFormulaKilos(100))
end
    
def obtenerFormulaEdadTest
    print validate("50mg Antipiretico",obtenerFormulaEdad(7))
    print validate("70mg Antipiretico",obtenerFormulaEdad(11))
    print validate("90mg Antipiretico",obtenerFormulaEdad(30))
end

def generarFormulaTest
    print validate("200mg Acido AcetilSalicilico y 50mg Antipiretico",generarFormula(30,7))
    print validate("350mg Acido AcetilSalicilico y 70mg Antipiretico",generarFormula(60,11))
    print validate("400mg Acido AcetilSalicilico y 90mg Antipiretico",generarFormula(100,30))
end
    
def validate (expected, value)
 expected == value ? "." : "F"
end

def test
  puts "Test de prueba del programa"
  puts "---------------------------"
  obtenerFormulaKilosTest
  obtenerFormulaEdadTest
  generarFormulaTest
  puts " "
end
test
