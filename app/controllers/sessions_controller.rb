class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # TODO: Show redirect to user page
    else
      flash.now[:danger] = 'Invalid email or password, combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
