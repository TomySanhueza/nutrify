class PatientsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    if @patient.save
      redirect_to @patient, notice: 'Patient created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthday, :weight, :height, :nutrition_plan, :clinical_history)
  end

end
