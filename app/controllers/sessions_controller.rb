class SessionsController < ApplicationController
  skip_before_filter :authenticate, :verify_authenticity_token

  def new
    redirect_to '/auth/google'
  end

  def create
    redirect_to = session[:redirect_to]
    reset_session

    if auth = request.env['omniauth.auth']
      user = User.find_or_create_by(:email => auth['info']['email'], :name => auth['info']['name'])
      session[:user_id] = user.id
      redirect_to redirect_to.nil? ? "/" : redirect_to
    end
  end
end
