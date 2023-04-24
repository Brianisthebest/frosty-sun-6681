class PatientsController < ApplicationController
  def index
    @patients = Patient.over_18_and_sorted_alphabetically
  end
end