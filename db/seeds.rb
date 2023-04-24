# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital_1 = Hospital.create!(name: 'Memorial Hospital')
@hospital_2 = Hospital.create!(name: 'Not Memorial Hospital')

@doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Medicine University')
@doctor_2 = @hospital_2.doctors.create!(name: 'John Doe', specialty: 'Pediatric Surgery', university: 'More Medicine University')

@patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
@patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
@patient_3 = Patient.create!(name: 'Sally Sue', age: 19)

PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)