require 'rails_helper'

RSpec.describe Hospital do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Judes Hospital')

    @doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Medicine University')
    @doctor_2 = @hospital_1.doctors.create!(name: 'John Doe', specialty: 'Pediatric Surgery', university: 'More Medicine University')
    @doctor_3 = @hospital_1.doctors.create!(name: 'Pac Man', specialty: 'Ghost Surgery', university: 'Fruit Snackin University')
    
    @doctor_4 = @hospital_2.doctors.create!(name: 'Jack Rack', specialty: 'General Surgery', university: 'University')
    @doctor_4 = @hospital_2.doctors.create!(name: 'Jack Black', specialty: 'Not General Surgery', university: 'University of Learnin Doctors')

    @patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
    @patient_3 = Patient.create!(name: 'Sally Sue', age: 19)

    PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)
  end

  it {should have_many :doctors}

  describe 'instance methods' do
    describe '#doctor_names' do
      it 'lists the doctors names' do
        expect(@hospital_1.doctor_names).to eq([@doctor_1, @doctor_2, @doctor_3])
      end
    end
  end
end
