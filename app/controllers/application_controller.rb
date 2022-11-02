class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
  before_action :line_messaging_login
  before_action :timeout

  def authenticate_user
    return if current_user.present?

    redirect_to user_line_omniauth_authorize_path
  end

  def line_messaging_login
    user = User.from_kamigo(params)
    return if user.nil?

    sign_in user
  end

  def timeout
    sleep rand * 120 if Setting.timeout
  end
end
