class ChatsController < ApplicationController
  before_action :set_patient
  before_action :set_chat, only: [:show,:destroy]

  def index
    @chats = @patient.chats
  end

  def show
    @messages = @chat.messages.order(created_at: :asc)
    @message = Message.new
  end

  def new
    @chat = @patient.chats.new
  end
  
  def create
    @chat = Chat.new(chat_params)
    @chat.patient = @patient
    @chat.user = current_user
    if @chat.save
      redirect_to patient_chats_path(@patient, @chat), notice: "Chat creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
    redirect_to patient_chats_path(@patient, @chat), notice: "Chat eliminado con éxito."
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_chat
    @chat = @patient.chats.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:title)
  end
end
