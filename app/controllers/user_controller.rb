class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Successfully signed up
      session[:user_id] = @user.id
      session[:first_name] = @user.first_name
      redirect_to currency_conversion_path, notice: 'Successfully signed in!'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
