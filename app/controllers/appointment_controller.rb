class AppointmentController < ApplicationController
  before_action :set_doctor

  def index
    @doctors = @doctor.appointments.where(role: 'doctor')
    @job = @doctor.appointments.where(role: 'job')
    @patient = @doctor.appointments.where(role: 'patient')
  end

  def new
    @patients = Patient.all - @doctor.patients
    @appointment = @doctor.appointment.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

 private
   def set_doctor
     @doctor = doctor.find(params[:doctor_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:role, :user_id)
   end
end