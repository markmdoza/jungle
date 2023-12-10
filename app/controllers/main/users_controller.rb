module Main
class UsersController < ApplicationController
  def new
    @user = User.new
end

  def create
    @user = User.new(user_prarams)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up'
      else
        render :new
      end
    end
      
      private 
      def user_prarams
        params.require(:user).permit(:emaail, :password,:password_confirmation)  
    end
end
end