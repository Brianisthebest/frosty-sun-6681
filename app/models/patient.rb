class Patient < ApplicationRecord
  has_many :patient_doctors, dependent: :destroy
  has_many :doctors, through: :patient_doctors
end