class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  # GET /patients/:id
  def show
    @patient = Patient.find(params[:id])
  end
end
