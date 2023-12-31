class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Successfully signed in
      session[:user_id] = user.id
      session[:first_name] = user.first_name
      redirect_to currency_conversion_path, notice: 'Successfully signed in!'
    else
      # Invalid email or password
      flash.now[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully signed out!'
  end
end
  