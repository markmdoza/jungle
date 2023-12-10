module Main
class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by(emaail: params[:session][:emaail])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end 
    
    def destroy
      session.delete(:user_id)
      redirect_to root_url, notice: 'You have successfully logged out!'
    end 
  end
end