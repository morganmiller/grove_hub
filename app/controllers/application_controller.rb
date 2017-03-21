class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_admin?
    current_user && current_user.admin?
  end
end
