class SessionsController < ApplicationController
  layout 'home_layout'

  before_action :redirect_if_signed_in, except: [:destroy]

  def new # login
    @user = User.new
  end

  def create # post login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_blogs_path(@user)
    else
      render :new
    end
  end

  def destroy # logout
    session.clear
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
