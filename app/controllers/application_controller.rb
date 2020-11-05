# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters #allowing devise to accept type attribute
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end

  #custom error message for unauthorised user
  rescue_from CanCan::AccessDenied do |exception|
	  if user_signed_in?
	    flash[:error] = "Access denied!"
	    redirect_to root_url
	  else
	    flash[:error] = "Please Sign in"
	    redirect_to new_user_session_path
	  end
	end
end
