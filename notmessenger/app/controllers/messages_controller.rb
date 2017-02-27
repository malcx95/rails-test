class MessagesController < ApplicationController

  def index
    @new_message = Message.new
    reset_session
  end

  def get_messages
    # get the current session's messages
    if !session.has_key?(:current_messages)
      session[:current_messages] = []
    end
    messages = []
    Message.all.each do |m|

      # if we haven't already displayed this message
      if !session[:current_messages].include?(m.id)
        message = {
          :user => m.user.name,
          :body => m.body,
          :created_at => m.created_at
        }
        messages << message
        session[:current_messages] << m.id
      end
    end

    respond_to do |format|
      format.html { render json: messages, status: :created, location: "yolo"  }
      format.json { render json: messages, status: :created, location: "yolo" }
    end
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
