FactoryGirl.define do
  factory :client, class: Client do
    name           Faker::GameOfThrones.character
    cpf            Faker::Number.unique.number(11)
    address        Faker::Address.street_name
    birthday       Faker::Date.birthday(18, 65)
    fone           Faker::Number.number(11)
    email          Faker::Internet.unique.email
    password       Faker::Internet.password
  end

  factory :employee, class: Employee do
    name           Faker::GameOfThrones.character
    cpf            Faker::Number.unique.number(11)
    address        Faker::Address.street_name
    birthday       Faker::Date.birthday(18, 65)
    fone           Faker::Number.number(11)
    email          Faker::Internet.unique.email
    password       Faker::Internet.password
    registrationID "REC001"
  end

  factory :room, class: Room do
    number              1
    capacity            2
    description         "Quarto regular para casal"
    price               170.00
    single_beds_number  0
    couple_beds_number  1

    trait :occupied do
      occupied          true
    end

    trait :free do
      occupied          false
    end
  end

  factory :meeting_room, class: MeetingRoom do
    number              3
    capacity            25
    description         "Sala de reuniões com computador, projetor e uma mesa redonda"
    price               200.00
    videoconf           false

    trait :occupied do
      occupied          true
    end

    trait :free do
      occupied          false
    end
  end

  factory :event_hall, class: EventHall do
    number              5
    capacity            100
    description         "Salão de eventos com 80 m2. Por padrão, sem serviço de buffet personalizado."
    price               600.00
    tables_number       20

    trait :occupied do
      occupied          true
    end

    trait :free do
      occupied          false
    end
  end

  factory :room_booking, class: RoomBooking do
    before(:create) do |room_booking|
      room_booking.client = FactoryGirl.create :client
      room_booking.employee = FactoryGirl.create :employee
      room_booking.accommodation = FactoryGirl.create :room, :free
    end
    description                   "As toalhas devem ser trocadas todo turno"
    start_date                    Date.current
    end_date                      Date.current + 15
  end

  factory :meeting_room_booking, class: MeetingRoomBooking do
    before(:create) do |meeting_room_booking|
      meeting_room_booking.client = FactoryGirl.create :client
      meeting_room_booking.employee = FactoryGirl.create :employee
      meeting_room_booking.accommodation = FactoryGirl.create :meeting_room, :free
    end
    description             "Preparar atas para a reunião"
    start_date              Date.current
    start_time              DateTime.now
  end

  factory :event_hall_booking, class: EventHallBooking do
    before(:create) do |event_hall_booking|
      event_hall_booking.client = FactoryGirl.create :client
      event_hall_booking.employee = FactoryGirl.create :employee
      event_hall_booking.accommodation = FactoryGirl.create :event_hall, :free
    end
    description             "Preparar atas para a reunião"
    start_date              Date.current
    period                  2
  end
end
