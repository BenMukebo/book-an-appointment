class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password)
    end
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone_number) }
  end
end

