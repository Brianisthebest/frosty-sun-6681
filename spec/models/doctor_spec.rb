require 'rails_helper'

RSpec.describe Doctor do
  before(:each) do
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
  end
  
  it {should belong_to :hospital}
  it {should have_many :patient_doctors}
  it {should have_many(:patients).through(:patient_doctors)}

  describe 'instance methods' do
    describe '#hospital_name' do
      it 'lists the doctors hospital name' do
        expect(@doctor_1.hospital_name).to eq(@hospital_1.name)
        expect(@doctor_2.hospital_name).to eq(@hospital_2.name)
      end
    end
    
    describe '#doctor_patients' do
      it 'lists the doctors patients names' do
        expect(@doctor_1.doctor_patients).to eq([@patient_1, @patient_2])
        expect(@doctor_2.doctor_patients).to eq([@patient_3])
      end
    end
  end
end
