class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to songs_path
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.username} signed in successfully."
      redirect_to songs_path
    else
      flash[:notice] = 'You are wrong.'
      render :new
    end
  end

  def destroy
    username = current_user.username
    session.clear
    flash[:notice] = "#{username} signed out successfully."
    redirect_to login_path
  end
end
