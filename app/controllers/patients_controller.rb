class PatientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @chats = @patient.chats
  end
  
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

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path, notice: 'Patient deleted successfully.'
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthday, :weight, :height, :nutrition_plan, :clinical_history)
  end 
end
