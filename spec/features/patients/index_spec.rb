require 'rails_helper'

RSpec.describe 'Patient Index Page', type: :feature do
  before(:each) do
    @patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
    @patient_3 = Patient.create!(name: 'Sally Sue', age: 19)
    @patient_4 = Patient.create!(name: 'Zach Zebra', age: 17)
  end

  describe 'User Story 3' do
    it 'I see names of all adult patients over 18 and sorted alphabetically' do
      visit patients_path

      expect(page).to have_content("Patient Index Page")

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_content(@patient_1.name)
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_content(@patient_2.name)
      end

      within "#patient-#{@patient_3.id}" do
        expect(page).to have_content(@patient_3.name)
      end
  
      expect(page).to_not have_content(@patient_4.name)
      
      expect(@patient_2.name).to appear_before(@patient_1.name)
      expect(@patient_1.name).to appear_before(@patient_3.name)
    end
  end
end