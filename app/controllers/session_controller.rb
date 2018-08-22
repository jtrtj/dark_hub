class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:name]
      user.token = auth_hash[:credentials][:token]
      user.user_name = auth_hash[:extra][:raw_info][:login]
    end

    session[:user_id] = user.id
    
    redirect_to dashboard_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end

  private
  
  def auth_hash
    request.env["omniauth.auth"]
  end
end
