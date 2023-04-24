class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors, dependent: :destroy
  has_many :patients, through: :patient_doctors

  def hospital_name
    hospital.name
  end
  
  def doctor_patients
    patients
  end

  def patient_count
    patients.size
  end
end
