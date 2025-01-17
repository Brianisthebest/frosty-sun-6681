require 'rails_helper'

RSpec.describe 'Hospital Show Page', type: :feature do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Judes Hospital')

    @doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Medicine University')
    @doctor_2 = @hospital_1.doctors.create!(name: 'John Doe', specialty: 'Pediatric Surgery', university: 'More Medicine University')
    @doctor_3 = @hospital_1.doctors.create!(name: 'Pac Man', specialty: 'Ghost Surgery', university: 'Fruit Snackin University')
    
    @doctor_4 = @hospital_2.doctors.create!(name: 'Jack Rack', specialty: 'General Surgery', university: 'University')
    @doctor_5 = @hospital_2.doctors.create!(name: 'Jack Black', specialty: 'Not General Surgery', university: 'University of Learnin Doctors')

    @patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
    @patient_3 = Patient.create!(name: 'Sally Sue', age: 19)
    @patient_4 = Patient.create!(name: 'Billy Bob', age: 19)

    PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)
    PatientDoctor.create!(patient_id: @patient_4.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_4.id, doctor_id: @doctor_2.id)
  end

  describe 'Extension' do
    it 'I see the hospitals name' do
      visit hospital_path(@hospital_1)

      expect(page).to have_content(@hospital_1.name)
    end

    it 'I see the names of all the doctors that work at this hospital' do
      visit hospital_path(@hospital_1)

      within "#doctor-info" do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_3.name)

        expect(page).to_not have_content(@doctor_4.name)
        expect(page).to_not have_content(@doctor_5.name)
      end
    end
    it 'next to each doctor is the number of patients associate with them' do
      visit hospital_path(@hospital_1)
        within "#doctor-id-#{@doctor_1.id}" do
          expect(page).to have_content("Number of Patients: 3")
        end
        save_and_open_page
        within "#doctor-id-#{@doctor_2.id}" do
          expect(page).to have_content("Number of Patients: 2")
        end
    end
    it 'orders the from most number of patients to least'
  end
# When I visit a hospital's show page
# I see the hospital's name
# And I see the names of all doctors that work at this hospital,
# And next to each doctor I see the number of patients associated with the doctor,
# And I see the list of doctors is ordered from most number of patients to least number of patients
# (Doctor patient counts should be a single query)
end