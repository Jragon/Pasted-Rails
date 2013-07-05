class SessionController < ApplicationController
  def create
    user = User.find_by_username(params['username'])

    if user && user.authenticate(params['password'])
      session['user_id'] = user.id
      redirect_to root_url, notice: 'Logged in successfully'
    else
      redirect_to login_url, alert: 'Username or Password incorrect'
    end
  end

  def destroy
    session['user_id'] = nil
    redirect_to root_url
  end
end