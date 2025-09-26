class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @patient_info = @chat.patient.attributes.to_json
    
    system_prompt = <<~PROMPT 
      Actúa como un asistente experto en nutrición y alimentación saludable.  
      Acompañas a nutricionistas en la mejora de planes nutricionales, entregando sugerencias, ajustes o cambios para sus pacientes **basados exclusivamente** en la información contenida en #{@patient_info}.  
      No considerarás ningún dato externo.  
      Tus respuestas se limitarán a temas nutricionales y alimenticios. Si detectas asuntos de otras áreas de la salud, sugiere al nutricionista recomendar al paciente contactar con el especialista correspondiente.  
      Responde de forma breve, profesional, clara y accionable, con el objetivo de facilitar y hacer más eficiente el trabajo del nutricionista.
    PROMPT

    @message = Message.new(message_params)
    @message.role = "user"
    @message.chat_id = @chat.id
    if @message.save
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(system_prompt).ask(@message.content)
      Message.create(
        role: "assistant",
        chat: @chat,
          content: response.content
        )
      redirect_to @chat
      else
        render "chats/show" , status: :unprocessable_entity 
      end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def build_conversation_history
    @ruby_llm_chat = RubyLLM.chat
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(role: message.role, content: message.content)
    end 
  end
end
