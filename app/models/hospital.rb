class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_names
    doctors
  end
end
