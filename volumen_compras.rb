
=begin
Desarrollar un programa que permita que a una empresa determinar el pago correspondiente 
según el volumen de compras de lotes de productos de bisutería china. 

En caso se compre un lote el pago será de 1500 soles. En caso se compren dos o tres lotes 
el pago será de 2800 soles. Si es que se compran desde cuatro hasta seìs lotes el pago 
será de 5800. Por la compra de más de seis lotes el pago será de 8200.   

=end


def pagoVolumen(lote)
  if lote == 1
    return 1500
  elsif lote >= 2 && lote <= 3
    return 2800
  elsif lote >= 4 && lote <= 6
    return 5800
  elsif lote > 6
    return 8200
  else
    return 0
  end 
end

puts "ingrese volumen de compras de lotes  de productos de bisuteria chima"
lote = gets.to_i

puts "El pago correspondientes es " + pagoVolumen(lote).to_s








