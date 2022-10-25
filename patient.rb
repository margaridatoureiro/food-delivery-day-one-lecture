class Patient
  # OLD WAY ---> NOOO (just for controllers, repos)
  # def initialize(name, cured, blood_type, ...)
#   @name = name # String
#   @cured = cured # Boolean
#   @blood_type = blood_type # String
  # end

  # NEW WAY (for models)
  attr_accessor :blood_type, :room, :id
  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type] || "A"
    @id = attributes[:id]
  end

  def cure!
    @cured = true
  end
end

# OLD WAY:
#mickey = Patient.new("Mickey", "A", false)
# NEW WAY:
mickey = Patient.new(cured: false, name: "Mickey", blood_type: "A")

fiona = Patient.new(name: "Fiona", cured: true)
fiona.blood_type = "B"
#p fiona

mandy = Patient.new({age: 20}) # -> here I'm passing an attributes hash with the key :age, but it gets lost without being stoed in an instance variable
#mandy.age = 20
#p mandy.age

