class PatientDoctorsController < ApplicationController
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @patient_doctor = PatientDoctor.where(doctor: @doctor, patient: @patient)

    @patient_doctor.destroy_all

    redirect_to doctor_path(@doctor)
  end
end