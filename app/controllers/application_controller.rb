# frozen_string_literal: true

#
# This is the base controller
#
class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: :forbidden
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
