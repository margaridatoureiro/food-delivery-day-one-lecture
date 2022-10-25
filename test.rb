require 'csv'
require_relative 'patient'

patients = []
CSV.foreach('patients.csv', headers: :first_row, header_converters: :symbol) do |row|
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean
  patients << Patient.new(row) # row is a hash
end

p patients