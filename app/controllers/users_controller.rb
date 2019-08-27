class UsersController < ApplicationController
  layout 'home_layout'
  before_action :redirect_if_signed_in

  def new # signup
    @user = User.new
  end

  def create # post signup
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_blogs_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
