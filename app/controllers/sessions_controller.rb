class SessionsController < ApplicationController

  def new
  end

  def create
    session[:user_name] = params[:user_name]
    User.find_or_create_by user_name: params[:user_name]
    redirect_to conversations_path
  end

  def destroy
    session[:user_name] = nil
    redirect_to login_path
  end

end
