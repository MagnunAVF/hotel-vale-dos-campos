FactoryGirl.define do
  factory :client, class: Client do
    name           "Roberto Marinho"
    cpf            99940072221
    address        "Rua João V 257"
    birthday       Date.parse('1950-08-12')
    fone           51888348866
    email          "roberto.marinho@gmail.com"
    password       "123456"
  end

  factory :employee, class: Employee do
    name           "Carlos da Silva"
    cpf            33340077831
    address        "Rua Riachuelo 345, apt 404"
    birthday       Date.parse('1970-01-20')
    fone           51987342211
    registrationID "REC001"
    email          "carlos.silva@gmail.com"
    password       "123456"
  end

  factory :free_room, class: Room do
    number              1
    capacity            2
    description         "Quarto regular para casal"
    price               170.00
    occupied            false
    single_beds_number  0
    couple_beds_number  1
  end

  factory :occupied_room, class: Room do
    number              2
    capacity            2
    description         "Quarto regular para casal"
    price               170.00
    occupied            true
    single_beds_number  0
    couple_beds_number  1
  end

  factory :free_meeting_room, class: MeetingRoom do
    number              3
    capacity            25
    description         "Sala de reuniões com computador, projetor e uma mesa redonda"
    price               200.00
    occupied            false
    videoconf           false
  end

  factory :occupied_meeting_room, class: MeetingRoom do
    number              4
    capacity            25
    description         "Sala de reuniões com computador, projetor e uma mesa redonda"
    price               200.00
    occupied            true
    videoconf           false
  end

  factory :free_event_hall, class: EventHall do
    number              5
    capacity            100
    description         "Salão de eventos com 80 m2. Por padrão, sem serviço de buffet personalizado."
    price               600.00
    occupied            false
    tables_number       20
  end

  factory :occupied_event_hall, class: EventHall do
    number              6
    capacity            100
    description         "Salão de eventos com 80 m2. Por padrão, sem serviço de buffet personalizado."
    price               600.00
    occupied            true
    tables_number       20
  end

  factory :room_booking, class: RoomBooking do
    client           Client.first
    employee         Employee.first
    accommodation    Room.first
    description      "As toalhas devem ser trocadas todo turno"
    start_date       Date.current
    end_date         Date.current + 15
  end

  factory :meeting_room_booking, class: MeetingRoomBooking do
    client           Client.first
    employee         Employee.first
    accommodation    Room.first
    description      "Preparar atas para a reunião"
    start_date       Date.current
    start_time       DateTime.now
  end

  factory :event_hall_booking, class: EventHallBooking do
    client           Client.first
    employee         Employee.first
    accommodation    Room.first
    description      "Preparar atas para a reunião"
    start_date       Date.current
    period           2
  end
end
