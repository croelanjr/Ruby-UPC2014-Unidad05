=begin
Una empresa desea realizar el cálculo del sueldo que debe pagar a un trabajador. 
Para ello se debe tomar en cuenta que hay tres tipos de trabajadores

1 Contratado
2 Tiempo Parcial
3 Freelance

En el caso del contratado su sueldo será de 1000 soles más 15% si es que ha trabajado horas extras. 

En el caso del Tiempo Parcial será de 500 soles más 8% por la cantidad de ventas logradas por comisión.

En el caso de Freelance será 25 soles por hora trabajada

Desarrollar el programa que me permita ingresar los datos y recibir el sueldo del trabajador.

Las primeras 2 soluciones correctas tendrán 4 puntos adicionales. Las siguientes 2 tendrán 3 puntos y así sucesivamente. 

=end

def sueldoContratado(horasExtras)
  sueldo = 1000
  if horasExtras > 0
    sueldo = sueldo + (horasExtras * 0.15)
  end 
  return sueldo 
end 

def sueldoTiempoParcial(cantidadVentasLogradas)
   sueldo = 500
   if cantidadVentasLogradas > 0
     sueldo = sueldo + (cantidadVentasLogradas * 0.08)
   end 
end 

def sueldoFreelance(horasTrabajadas)
  return horasTrabajadas * 25
end 

def calcular(tipo)
  case tipo
    when 1 #"Contratado"
	  puts "ingrese horas extras" 
	  horasExtras = gets.to_i
	  puts "El sueldo es: " + sueldoContratado(horasExtras).to_s
	when 2 #"Tiempo Parcial"
	  puts "Ingrese cantidad de ventas logradas"
	  cantidadVentasLogradas = gets.to_i
	  puts "El sueldo es: " + sueldoTiempoParcial(cantidadVentasLogradas).to_s
	when 3 #"Freelance"
	  puts "Ingrese hotas trabajadas"
	  horasTrabajadas = gets.to_i
	  puts "El sueldo es: " + sueldoFreelance(horasTrabajadas).to_s
  end
end

terminar = 's'
while terminar != 'n'
  puts "Ingrese tipo calculo de sueldo [1] Contratado [2] Tiempo Parcial [3] Freelance "
  tipo = gets.to_i
  calcular(tipo)
  puts "Desea ralizar otro calculo [s] / [n]"
  terminar = gets.chomp
end 