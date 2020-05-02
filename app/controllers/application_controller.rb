class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :check_login

  private
  def record_not_found
    render file: 'public/404.html', #連入檔案
    status: 404, #給瀏覽器看的狀態
    layout: false #不要使用公共layout
  end

  def check_login
    redirect_to login_path unless current_user
  end

  def current_user
    session[:ccc9527]
  end
end
