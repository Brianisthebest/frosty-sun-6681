require 'rails_helper'

RSpec.describe Patient, type: :model do
  before(:each) do
    @patient_1 = Patient.create!(name: 'Jim Carey', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Denise', age: 39)
    @patient_3 = Patient.create!(name: 'Sally Sue', age: 19)
    @patient_4 = Patient.create!(name: 'Zach Zebra', age: 17)
  end

  describe 'relationships' do
    it { should have_many :patient_doctors }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe 'class methods' do
    describe '#over_18' do
      it 'selects patients over 18' do
        expect(Patient.over_18_and_sorted_alphabetically).to eq([@patient_2, @patient_1, @patient_3])
      end
    end
  end
end