class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  protected
    def authorize
      @username = session[:username]
      unless @username
        redirect_to login_url, alert: '使用系统前请先登录。'
      end
    end
end
