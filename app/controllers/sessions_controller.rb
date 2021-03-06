class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now.alert = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to top_path
  end
end
