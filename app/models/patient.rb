class Patient < ApplicationRecord
  has_many :patient_doctors, dependent: :destroy
  has_many :doctors, through: :patient_doctors

  def self.over_18_and_sorted_alphabetically
    where("age >= 18").order(:name).to_a
  end
end