require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Judes Hospital')

    @doctor_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Medicine University')
    @doctor_2 = @hospital_2.doctors.create!(name: 'John Doe', specialty: 'Pediatric Surgery', university: 'More Medicine University')

    @patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
    @patient_3 = Patient.create!(name: 'Sally Sue', age: 19)

    PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)
  end

  describe 'User Story 1' do
    it 'I can see all of the doctors information, including name, specialty, and university' do
      visit doctor_path(@doctor_1)

      within '#doctor-info' do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content("Specialty: #{@doctor_1.specialty}")
        expect(page).to have_content("University: #{@doctor_1.university}")
      end

      visit doctor_path(@doctor_2)

      within '#doctor-info' do
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content("Specialty: #{@doctor_2.specialty}")
        expect(page).to have_content("University: #{@doctor_2.university}")
      end
    end

    it 'I can see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor_1)

      within '#hospital-info' do
        expect(page).to have_content("Hospital: #{@hospital_1.name}")
        expect(page).to_not have_content(@hospital_2.name)
      end

      visit doctor_path(@doctor_2)

      within '#hospital-info' do
        expect(page).to have_content("Hospital: #{@hospital_2.name}")
        expect(page).to_not have_content(@hospital_1.name)
      end
    end

    it 'I can see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor_1)

      within '#patient-info' do
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_2.name)
        expect(page).to_not have_content(@patient_3.name)
      end
save_and_open_page
      visit doctor_path(@doctor_2)

      within '#patient-info' do
        expect(page).to have_content(@patient_3.name)
        expect(page).to_not have_content(@patient_1.name)
        expect(page).to_not have_content(@patient_2.name)
      end
    end

# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
  end
end