class MeetingRoom < Accommodation
  validates :occupied, inclusion: { in: [ true, false ] }
end
