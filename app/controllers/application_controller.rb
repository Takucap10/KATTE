class ApplicationController < ActionController::Base
  before_action :configue_parmitted_parameter, if: :devise_controller?

  private
  def configue_parmitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end