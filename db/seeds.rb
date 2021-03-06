print "*** Creating initial DB ***\n"
print "Seeding DB ...\n"

print "Creating Hotel Information\n"
Hotelinformation.create(
  description: "Fundado em 1978, o hotel Vale dos Campos é uma referência na serra gaúcha. Nossa infraestrutura conta com 122 quartos, 12 ​salas de reunião, 2 ​salões de eventos, com capacidade para 100 pessoas cada, restaurante e áreas de lazer. Aqui recebemos diversos hóspedes durante todo o ano, os quais vêm tanto para diversão e turismo quanto para reuniões de negócio.",
  email:"hotelvaledoscampos@gmail.com",
  address: "Rua X num 123",
  fone: 51934772233
)

print "Creating Accommodations ...\n"
number_fixture = 1
# boolean_fixture = true
boolean_fixture = false

print "Creating Rooms \n"

for i in 1..50
  Room.create(
    number: number_fixture,
    capacity: 2,
    description: "Quarto regular para casal",
    price: 170.00,
    occupied: boolean_fixture,
    single_beds_number: 0,
    couple_beds_number: 1
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

for i in 1..30
  Room.create(
    number: number_fixture,
    capacity: 2,
    description: "Quarto regular",
    price: 180.00,
    occupied: boolean_fixture,
    single_beds_number: 2,
    couple_beds_number: 0
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

for i in 1..30
  Room.create(
    number: number_fixture,
    capacity: 4,
    description: "Quarto Familiar",
    price: 240.00,
    occupied: boolean_fixture,
    single_beds_number: 2,
    couple_beds_number: 1
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

for i in 1..12
  Room.create(
    number: number_fixture,
    capacity: 4,
    description: "Quarto familiar com 2 camas de casal",
    price: 220.00,
    occupied: boolean_fixture,
    single_beds_number: 0,
    couple_beds_number: 2
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

print "Creating Meeting Rooms\n"
for i in 1..10
  MeetingRoom.create(
    number: number_fixture,
    capacity: 25,
    description: "Sala de reuniões com computador, projetor e uma mesa redonda",
    price: 200.00,
    occupied: boolean_fixture,
    videoconf: false
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

for i in 1..2
  MeetingRoom.create(
    number: number_fixture,
    capacity: 25,
    description: "Sala de reuniões para videoconferência com computador, projetor, 3 câmeras e uma grande mesa redonda com entradas de audio",
    price: 300.00,
    occupied: boolean_fixture,
    videoconf: true
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

print "Creating Event Hall\n"
for i in 1..2
  EventHall.create(
    number: number_fixture,
    capacity: 100,
    description: "Salão de eventos com 80 m2. Por padrão, sem serviço de buffet personalizado.",
    price: 600.00,
    occupied: boolean_fixture,
    tables_number: 20
  )
  number_fixture += 1
  # boolean_fixture = !boolean_fixture
end

print "Creating users ...\n"

print "Creating Employee\n"
employee01 = Employee.create(
  name: "Carlos da Silva",
  cpf: 33340077831,
  address: "Rua Riachuelo 345, apt 404",
  birthday: Date.parse('1970-01-20'),
  fone: 51987342211,
  email: "carlos.silva@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  registrationID: "REC001",
)

print "Creating Clients\n"
client01 = Client.create(
  name: "Roberto Marinho",
  cpf: 99940072221,
  address: "Rua João V 257",
  birthday: Date.parse('1950-08-12'),
  fone: 51888348866,
  email: "roberto.marinho@gmail.com",
  password: "123456",
  password_confirmation: "123456",
)
client02 = Client.create(
  name: "Claudia Garcia",
  cpf: 99977222999,
  address: "Rua Marechal Hermes 12",
  birthday: Date.parse('1990-03-27'),
  fone: 51888348866,
  email: "claudia.garcia@gmail.com",
  password: "123456",
  password_confirmation: "123456",
)

print "Creating Bookings ...\n"
# bookings for Roberto Marinho
RoomBooking.create(
  client: client01,
  employee: employee01,
  accommodation: Room.first,
  description: "Reserva regular. Nenhum pedido especial.",
  start_date: Date.current,
  end_date: Date.current + 5,
  active: true
)
MeetingRoomBooking.create(
  client: client01,
  employee: employee01,
  accommodation: MeetingRoom.find(134),
  description: "Preparar a sala 10 minutos antes",
  start_date: Date.current,
  start_time: DateTime.now.change({ hour: 9, min: 0, sec: 0 }),
  active: true
)

# bookings for Claudia Garcia
RoomBooking.create(
  client: client02,
  employee: employee01,
  accommodation: Room.second,
  description: "As toalhas devem ser trocadas todo turno",
  start_date: Date.current,
  end_date: Date.current + 15,
  active: true
)
MeetingRoomBooking.create(
  client: client02,
  employee: employee01,
  accommodation: MeetingRoom.find(130),
  description: "Preparar atas para a reunião",
  start_date: Date.current,
  start_time: DateTime.now.change({ hour: 15, min: 0, sec: 0 }),
  active: true
)
EventHallBooking.create(
  client: client02,
  employee: employee01,
  accommodation: EventHall.find(136),
  description: "Festa pós reunião",
  start_date: Date.current,
  period: 2,
  active: true
)

print "Alterations after bookings"
accommodation = Room.all.first
accommodation.occupied = true
accommodation.save
accommodation = Room.all.second
accommodation.occupied = true
accommodation.save
accommodation = EventHall.find(136)
accommodation.occupied = true
accommodation.save

print "Done! DB populated ! \n"
