# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def quick_login
    # USE ONLY IN DEV MODE !!!
    user = User.find_by(email: params[:email])
    if user
      sign_in(user)

      ::SendEmailJob.perform_async(user.id)
      redirect_to root_path, notice: "Logged in as #{user.email}"
    else
      redirect_to new_user_session_path, alert: "User not found."
    end
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  #
end
