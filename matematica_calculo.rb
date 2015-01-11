#encoding:UTF-8
=begin 
Un profesor de matemática le ha encargado realizar un programa para realizar los cálculos de la siguiente fórmula:
       n                              n
X = Sumatoria ((a-b)exp(i)-3)+n / Sumatoria (2+a * (i-1))
       1                              1
Donde i = toma valores de 1..n

Desarrollar un subprograma que calcule el dividendo de la operación.
Desarrollar un subprograma que calcule el divisor de la operación.
Desarrollar un subprograma que calcule la operación final.

=end
def dividendo(n,a,b)
  sumatoria1 = 0
  for i in 1..n
      sumatoria1 = sumatoria1 + (((a - b) ** i) - 3) + n
  end
  return sumatoria1 / n
end

def divisor(n,a)
  sumatoria2 = 0
  for i in 1..n
    sumatoria2 = sumatoria2 + (2 + (a * (i - 1)))
  end
  return sumatoria2
end

def formula(n,a,b)
  total = 0.0
  sumatoria3 = dividendo(n,a,b)
  sumatoria4 = divisor(n,a)
  total = sumatoria3.to_f / sumatoria4.to_f
  return total.round(2)
end

#--- zona del programa principal ----

#--- zona de test ----

def test_dividendo
    print validate(84694922988023, dividendo(10,34,3))
    print validate(1111111118, dividendo(10,20,10))    
    print validate(38805107275644938178, dividendo(30,15,10))
end

def test_divisor
    print validate(1550, divisor(10,34))
    print validate(920, divisor(10,20))    
    print validate(6585, divisor(30,15))
end

def test_formula
    print validate(54641885798.72, formula(10,34,3))
    print validate(1207729.48, formula(10,20,10))    
    print validate(5892954787493530.0, formula(30,15,10))
end

def validate (expected, value)
 expected == value ? "." : "F"
end

def test 
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_dividendo
  test_divisor
  test_formula
  puts " "
end
test
  
