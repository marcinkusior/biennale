class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def current_administrator
    @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_administrator

  def authorize
    redirect_to '/login' unless current_administrator
  end

  def block
    if General.first.block_site == true
      redirect_to '/inactive' unless current_administrator
    end
  end

  private
  def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end
  
end
