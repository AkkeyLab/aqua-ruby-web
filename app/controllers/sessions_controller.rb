class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    is_auth_user = user.authenticate(params[:session][:password])
    if user && is_auth_user
      # TODO: Show redirect to user page
    else
      # TODO: Show error message
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
