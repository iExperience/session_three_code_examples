class SessionsController < ApplicationController

  def new
  end

  def create
    username_or_email = params[:username_or_email]
    user = User.find_by(email: username_or_email) || User.find_by(username: username_or_email)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to sign_in_path, notice: "Incorrect username/email or password"
    end   
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end