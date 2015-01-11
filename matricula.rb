#encoding:UTF-8
=begin
A pocos días de empezar la matricula escolar, muchos padres de familia del Colegio “Mejora
School” empiezan a sacar sus cuentas acerca del presupuesto que van a necesitar tener para
poder enviar a sus hijos al colegio completamente uniformados.

Con tal motivo, el colegio ha decidido hacer unos ajustes en sus tarifas para este nuevo año
escolar, el cual se resume de la siguiente manera:

-Matricula: 1500 nuevos soles.
-Pensión Mensual: 1800 nuevos soles.
-Número de Boletas a Pagar: 10

Adicionalmente, el uniforme del colegio lo pueden conseguir con los siguientes precios:
- Uniforme escolar masculino: 180 nuevos soles.
- Uniforme escolar femenino: 220 nuevos soles.
- Uniforme deportivo masculino: 120 nuevos soles.
- Uniforme deportivo femenino: 150 nuevos soles.

Sabiendo que existen algunos padres de familia que tienen mas de 1 hijo en el colegio, se
esta otorgando 1/8 de beca para cada hijo que estudie en el colegio. La beca aplica sobre las
mensualidades mas no en la matrícula.

Con la información brindada el padre de familia necesita hacer unos cálculos para lo cual usted
lo va a ayudar desarrollando un programa Ruby que ayude en la realización de estos.

Se pide implementar un método que permita determinar si es que un padre de familia tiene
derecho o no a acceder al octavo de beca brindado por el colegio.

Se pide implementar un método que permita determinar al padre de familia cuanto debe de
invertir en uniformes escolares y deportivos.

Se pide implementar un método que permita determinar cuanto va a ser el monto total a pagar
por el padre de familia para poder enviar al colegio a sus hijos.

Se pide implementar un método que permita determinar cuanto es el ahorro total que tendría
un padre de familia si es que tiene más de 1 hijo en el colegio.
=end
def padreTieneDerechoBeca(numHijos)
    if numHijos <= 1
      return false
    else
      return true
    end
end
    
def montoInvertirEnUniformes(numHijos, numHijas)
    uniforme_masculino = 180.00
    uniforme_femenino = 220.00
    uniforme_depor_masc = 120.00
    uniforme_depor_feme = 150.00
    return ((numHijos * uniforme_masculino) + (numHijas * uniforme_femenino) + (numHijos * uniforme_depor_masc) + (numHijas * uniforme_depor_feme)).round(2)
end
    
def montoTotalAPagar(numHijos, numHijas)
    matricula = 1500
    pension_mensual = 1800
    numero_boletas = 10
    cantidad_hijos = numHijos + numHijas
    becas = padreTieneDerechoBeca(cantidad_hijos)
    total_uniforme = montoInvertirEnUniformes(numHijos, numHijas)
    if becas == true
        precio_beca = pension_mensual - (pension_mensual / 8)
    else
        precio_beca = pension_mensual
    end
    return (((precio_beca * numero_boletas) + matricula) * cantidad_hijos) + total_uniforme
end
    
def obtenerAhorroPorMasDeUnHijo(numHijos, numHijas)
    monto_beca = montoTotalAPagar(numHijos, numHijas)
    matricula = 1500
    pension_mensual = 1800
    numero_boletas = 10
    cantidad_hijos = numHijos + numHijas
    becas = padreTieneDerechoBeca(cantidad_hijos)
    total_uniforme = montoInvertirEnUniformes(numHijos, numHijas)
    monto_real = (((pension_mensual * numero_boletas) + matricula) * cantidad_hijos) + total_uniforme
    return monto_real - monto_beca
end


#----------------Zona de Test
    
def test_padreTieneDerechoBeca
  print validate(false, padreTieneDerechoBeca(0))
  print validate(false, padreTieneDerechoBeca(1))
  print validate(true, padreTieneDerechoBeca(2))
end

def test_montoInvertirEnUniformes
  print validate(970, montoInvertirEnUniformes(2,1))
  print validate(1040, montoInvertirEnUniformes(1,2))
  print validate(370, montoInvertirEnUniformes(0,1))
  print validate(300, montoInvertirEnUniformes(1,0))
end

def test_montoTotalAPagar
  print validate(52720, montoTotalAPagar(2,1))
  print validate(52790, montoTotalAPagar(1,2))
  print validate(19870, montoTotalAPagar(0,1))
end

def test_obtenerAhorroPorMasDeUnHijo
  print validate(6750, obtenerAhorroPorMasDeUnHijo(1,2))
  print validate(0, obtenerAhorroPorMasDeUnHijo(0,1))
end


def validate (expected, value)
 expected == value ? "." : "F"
end

def test
   
  puts "Test de prueba del programa"
  puts "---------------------------"
  test_padreTieneDerechoBeca
  test_montoInvertirEnUniformes
  test_montoTotalAPagar
  test_obtenerAhorroPorMasDeUnHijo
  puts " "
end
test
