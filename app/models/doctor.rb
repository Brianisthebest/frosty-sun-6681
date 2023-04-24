class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def hospital_name
    hospital.name
  end
  
  def doctor_patients
    patients.pluck(:name)
  end
end
