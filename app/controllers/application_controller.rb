class ApplicationController < ActionController::Base
  before_action :set_locale 
  
  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
      redirect_to params[:url] || root_path
    end
    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end
end
