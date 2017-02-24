class MessagesController < ApplicationController

  def index
    @messages = Message.all

    @new_message = Message.new
  end
  
  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)

    @message.save
    redirect_to :action => 'index'
  end

  private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end
