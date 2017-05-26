if Hotelinformation.all.empty?
  Hotelinformation.create(description: "Hotel localizado na Serra do RS.", email:"hotelvaledoscampos@gmail.com", fone: "51999998877", address: "Rua X num 123")
else
  print "HotelInformation exists !"
end
