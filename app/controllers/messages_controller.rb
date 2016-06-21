class MessagesController < ApplicationController
  before_action :authenticate

  def conversations
    @users = User.all
  end


  def chat
    @user_name = session[:user_name]
    @peer_name = params[:peer_name]
    @messages = Message.where("sender_name = ? and receiver_name = ? or sender_name = ? and receiver_name = ?", @user_name, @peer_name, @peer_name, @user_name)
  end

  def create
    @message = Message.new(message_params)
    @message.sender_name = session[:user_name]

    if @message.save
      respond_to do |format|
        format.js
        format.json { render json: @message}
      end
    end
  end

  private
    def message_params
      params.require(:message).permit(:receiver_name, :content)
    end

    def authenticate
      redirect_to login_path if session[:user_name].blank?
    end
end
