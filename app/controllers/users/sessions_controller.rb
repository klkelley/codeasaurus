class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # :skip_before_filter :require_no_authentication, only: [:index]



  # GET /resource/sign_in
  def new
    redirect_to '/butts' if user_signed_in?
  end

  # POST /resource/sign_in
  def create
    super
    redirect_to '/butts'
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
