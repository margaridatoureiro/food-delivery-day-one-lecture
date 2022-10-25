require_relative "patient"
class Room
  attr_accessor :id 
  # creating a customized Exception class 
  class CapacityReachedError < Exception; end

  def initialize(attributes = {})
    # STATE
    @capacity = attributes[:capacity] # Integer
    @patients = attributes[:patients] || [] # Array of Patient instances
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    if full?
      raise CapacityReachedError, "The room is full!!"
    else
      patient.room = self # self is the instance on which I'm calling the method
      @patients << patient
    end
  end
end

# *** JUST TO SHOW YOU HOW THE MECHANISM WORKS: ***
# this is a very exagerated example !!
# check the documentation of Ruby for Exception to know more 
begin 
  room_1 = Room.new(capacity: 2)
  mickey = Patient.new(cured: false, name: "Mickey", blood_type: "A")
  fiona = Patient.new(name: "Fiona", cured: true)
  mandy = Patient.new(name: "Mandy", blood_type: "B")
  
  room_1.add_patient(mickey)
  room_1.add_patient(fiona)
  
  puts "Is the room full?"
  p room_1.full?
  
  room_1.add_patient(mandy)
  
rescue Room::CapacityReachedError
  puts "That's alright, we don't add Mandy"
  # sleep(3600)
end
#p fiona.room
#p room_1