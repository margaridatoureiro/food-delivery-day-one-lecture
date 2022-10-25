require_relative 'patient'
require 'csv'
class PatientRepository
  def initialize(room_repository)
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
  end

  def load_csv
    CSV.foreach('patients.csv', headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      # TODO -----------------------------------------
      row[:room_id].to_i # id of the room
      # find in the room repository the room with the id I found in the row
      # set the room for the given patient
      room = @room_repository.find(row[:room_id].to_i)
      patient = Patient.new(row)
      patient.room = room
      # ---------------------------
      @patients << patient # row is a hash
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end

repo = PatientRepository.new

phillip = Patient.new(name: "Phillip", cured: true)
 p phillip
#sara = Patient.new(name: "Sara", cured: false, blood_type: "O")

repo.create(phillip)
repo.create(Patient.new(name: "Sara", cured: false, blood_type: "O"))

p repo
