class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit additional sign up parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :full_name, :phone_number, :organization_type, :location, :contact_preference
    ])
  end
end
