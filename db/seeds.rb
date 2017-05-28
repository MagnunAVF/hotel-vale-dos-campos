print "*** Creating initial DB ***"
print "Seeding DB ..."

print "Creating Hotel Information"
Hotelinformation.create(
  description: "Hotel localizado na Serra do RS.",
  email:"hotelvaledoscampos@gmail.com",
  fone: "51999998877",
  address: "Rua X num 123"
)

print "Creating Accommodations ..."
number_fixture = 1
boolean_fixture = false

print "Creating Rooms "

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
  boolean_fixture = !boolean_fixture
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
  boolean_fixture = !boolean_fixture
end

print "Creating Meeting Rooms"
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
  boolean_fixture = !boolean_fixture
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
  boolean_fixture = !boolean_fixture
end

print "Creating Event Hall"
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
  boolean_fixture = !boolean_fixture
end
