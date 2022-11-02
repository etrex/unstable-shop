# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    is_fail = Setting.login_fail
    fail_before_action = rand > 0.5

    raise StandardError.new '模擬登入失敗' if is_fail && fail_before_action

    super

    raise StandardError.new '模擬登入失敗' if is_fail && !fail_before_action
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
