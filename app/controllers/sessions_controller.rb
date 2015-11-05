class SessionsController < ApplicationController

  def new

  end

  def create
    params[:email]
    params[:password]
    user = Userss.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In!"
    else
      flash[:alert] = "Wrong Credentials!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
