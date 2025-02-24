class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_user_id

  private
  def set_user_id
    session[:user_id] ||= SecureRandom.random_number(1000)# Generate a unique user ID if not already set
  end
end
